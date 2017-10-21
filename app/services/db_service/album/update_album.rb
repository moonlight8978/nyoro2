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
    return self unless params_valid?

    ActiveRecord::Base.transaction do
      submit_changes
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

  def params_valid?
    @latest_version.assign_attributes(@params)
    changed = @latest_version.changed?
    valid = @latest_version.valid?
    changed && valid
  end

  def submit_changes
    @latest_version = DbService::Album::CloneAlbumLatest
      .new(user: @current_user, album: @album, params: @params)
      .perform
  end

  def log_update_action
    @album.log_update(@current_user, @latest_version.title, @optionals[:description])
  end
end
