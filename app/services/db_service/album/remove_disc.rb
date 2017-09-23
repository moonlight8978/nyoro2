class DbService::Album::RemoveDisc
  attr_reader :album
  
  def initialize(album_version_id, disc_id, current_user, **optionals)
    @album_version = Db::AlbumVersion.find(album_version_id)
    @album = @album_version.album
    @disc = Db::Disc.find(disc_id)
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    return self unless user_request_to_edit_latest_version?
    
    ActiveRecord::Base.transaction do
      create_new_latest_album_version
      remove_request_disc_from_collection_and_assign_to_new_version
      make_new_version_as_latest
      log_destroy_action
    end
  
    self
  end
  
private
  
  def user_request_to_edit_latest_version?
    @album_version == @album.latest_version
  end
  
  def create_new_latest_album_version
    @album_latest = @album.album_versions
      .build(@album_version.dup.attributes)
    @album_latest.update(
      previous_version: @album_version,
      image: @album_version.image
    )
  end
  
  def remove_request_disc_from_collection_and_assign_to_new_version
    disc_ids = @album_version.disc_ids - [@disc.id]
    @album_latest.disc_ids = disc_ids
  end
  
  def make_new_version_as_latest
    @album.update(latest_version: @album_latest)
  end
  
  def log_destroy_action
    @album.log_destroy(
      @current_user, 
      "ディスク#{@disc.number}", 
      @optionals[:description]
    )
  end
end