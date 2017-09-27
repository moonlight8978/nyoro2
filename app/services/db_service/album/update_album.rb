class DbService::Album::UpdateAlbum
  attr_reader :latest_version, :album, :title, :title_en
  
  def initialize(album_id, params, current_user, **optionals)
    @album = Db::Album.includes(:latest_version).find(album_id)
    @latest_version = @album.latest_version
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    backup_ui_variables
    ActiveRecord::Base.transaction do
      check_if_user_made_any_changes!
      create_new_version!
      assign_old_associations
      make_new_version_as_latest
      log_update_action
    end
  
    self
  end
  
  def errors?
    @album.errors.any? || @latest_version.errors.any?
  end
  
private

  def backup_ui_variables
    @title = @latest_version.title
    @title_en = @latest_version.title_en
  end
  
  def check_if_user_made_any_changes!
    @latest_version.assign_attributes(@params)
    raise ActiveRecord::Rollback unless @latest_version.changed?
  end
  
  def create_new_version!
    @latest_version = @album.album_versions.build(@latest_version.dup.attributes)
    @latest_version.assign_attributes(
      image: @params[:image] || @album.latest_version.image,
      previous_version: @album.latest_version
    )
    raise ActiveRecord::Rollback unless @latest_version.save
  end
  
  def assign_old_associations
    @latest_version.disc_ids = @latest_version.previous_version.disc_ids
  end
  
  def make_new_version_as_latest
    @album.update(latest_version: @latest_version)
  end
  
  def log_update_action
    @album.log_update(@current_user, @latest_version.title, @optionals[:description])
  end
end