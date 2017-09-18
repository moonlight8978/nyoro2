class DbService::Album::UpdateSong
  attr_reader :song, :latest_version, :title, :page_title, :page_title_en
  
  def initialize(song_id, params, current_user, **optionals)
    @song = Db::Song.find(song_id)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    backup_data_for_ui
    ActiveRecord::Base.transaction do
      check_if_any_changes!
      create_new_version!
      make_new_version_as_latest
      log_update_action
    end
  
    self
  end
  
  def errors?
    @latest_version.errors.any?
  end
  
private

  def backup_data_for_ui
    @page_title = @song.latest_version.title
    @page_title_en = @song.latest_version.title_en
  end
  
  def check_if_any_changes!
    @song.latest_version.assign_attributes(@params)
    unless @song.latest_version.changed?
      @latest_version = @song.latest_version
      raise ActiveRecord::Rollback
    end
  end
  
  def create_new_version!
    @latest_version = @song.song_versions.build(@song.latest_version.dup.attributes)
    @latest_version.assign_attributes(previous_version: @song.latest_version)
    raise ActiveRecord::Rollback unless @latest_version.save
  end
  
  def make_new_version_as_latest
    @song.update(latest_version: @latest_version)
  end
  
  def log_update_action
    @song.disc.album_versions.last.album.log_update(
      @current_user,
      "歌・#{@latest_version.title}",
      @optionals[:description]
    )
  end
end