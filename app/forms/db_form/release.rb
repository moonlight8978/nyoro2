class DbForm::Release
  # extend ActiveModel::Naming
  include ActiveModel::Dirty
  include ActiveModel::Model
  
  # associations
  delegate :price, :currency, :format, :released_at, :catalog_number, :note, 
    :publisher_id, :publisher,
    to: :release
  attr_accessor :album, :release
  # class methods
  # validates
  validates :format, presence: true
  # callbacks
  # instance methods
  def release
    @release ||= Db::Release.new
  end
  
  def create(params, current_user)
    assign_latest(params)
    if valid?
      ActiveRecord::Base.transaction do
        create_new_latest_album_version
        assign_associations
        assign_release_to_album_version
        log_action(:create, current_user)
      end
    end
  end
  
  def update(params, current_user)
    assign_latest(params)
    if valid?
      ActiveRecord::Base.transaction do
        create_new_latest_album_version
        assign_associations
        assign_new_release
        log_action(:update, current_user)
      end
    end
  end
  
  def persisted?
    false
  end
  
private

  def assign_latest(params)
    release.assign_attributes(params)
  end
  
  def create_new_latest_album_version
    @album_latest = Db::AlbumVersion.new(album.latest_version.dup.attributes)
    @album_latest.update(
      previous_version: album.latest_version,
      image: album.latest_version.image
    )
  end
  
  def assign_associations
    @album_latest.disc_ids = album.latest_version.disc_ids
    album.update(latest_version: @album_latest)
    album.publisher_ids = [release.publisher_id]
  end
  
  def assign_release_to_album_version
    @album_latest.release = release
  end
  
  def log_action(action, current_user)
    method = "log_#{action}".to_sym
    album.send method, 
      current_user, 
      "発売情報・#{album.latest_version.title}", 
      "#{album.latest_version.title}の新しい発売情報が作られました。"
  end
  
  def assign_new_release
    @album_latest.release = Db::Release.new(release.dup.attributes)
  end
end