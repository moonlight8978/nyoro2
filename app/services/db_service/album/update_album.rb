class DbService::Album::UpdateAlbum
  attr_reader :latest_version, :album, :old_title
  
  def initialize(album_id, params, current_user, **optionals)
    @album = Db::Album.includes(:latest_version).find(album_id)
    @old_title = @album.latest_version.title
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      clone_latest_version_and_assign_new_values!
      assign_current_latest_version_to_new_version!
      assign_new_version_to_album
      log_update_action
    end
  
    self
  end
  
  def errors?
    @album.errors.any? || @latest_version.errors.any?
  end
  
private
  
  def clone_latest_version_and_assign_new_values!
    @latest_version = @album.album_versions.create(@album.latest_version.dup.attributes)
    @latest_version.assign_attributes(image: @album.latest_version.image)
    @latest_version.assign_attributes(@params)
    raise ActiveRecord::Rollback unless @latest_version.changed?
  end
  
  def assign_current_latest_version_to_new_version!
    @latest_version.previous_version = @album.latest_version
    raise ActiveRecord::Rollback unless @latest_version.save
  end
  
  def assign_new_version_to_album
    @album.update(latest_version: @latest_version)
  end
  
  def log_update_action
    @album.log_update(@current_user, @latest_version.title, @optionals[:description])
  end
end