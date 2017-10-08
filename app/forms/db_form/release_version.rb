class DbForm::ReleaseVersion
  # extend ActiveModel::Naming
  include ActiveModel::Dirty
  include ActiveModel::Model
  
  attr_accessor :release_id, :previous_version_id, :price, :currency, :format, 
    :released_at, :catalog_number, :note, :album
  attr_reader :release, :latest
  
  validates :format, presence: true
  
  def create_release
    if valid?
      ActiveRecord::Base.transaction do
        create_release_version
        create_album_release_with_latest_verison
        create_new_latest_album_version
        assign_associations
      end
    end
  end
  
  def update_release
    #code
  end
  
  def persisted?
    false
  end
  
private

  def create_release_version
    @latest = Db::ReleaseVersion.create(
      price: price, currency: currency, format: format, released_at: released_at,
      catalog_number: catalog_number, note: note
    )
  end
  
  def create_album_release_with_latest_verison
    @release = Db::Release.create(latest_version: @latest)
    @latest.update(release: @release)
  end
  
  def create_new_latest_album_version
    @album_latest = Db::AlbumVersion.new(album.latest_version.dup.attributes)
    @album_latest.update(
      previous_version: album.latest_version,
      image: album.latest_version.image
    )
  end
  
  def assign_associations
    @album_latest.releases << @release
    album.releases << @release
    
    @album_latest.disc_ids = album.latest_version.disc_ids
    album.update(latest_version: @album_latest)
  end
end