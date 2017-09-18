class DbService::Album::UpdateSong
  attr_reader :song, :latest_version, :title, :page_title, :page_title_en
  
  def initialize(song_id, params, current_user, **optionals)
    @song = Db::Song.find(song_id)
    @params = params
    @current_user = current_user
    @optionals = optionals
    backup_data_for_ui
  end
  
  def perform
    ActiveRecord::Base.transaction do
      clone_current_latest_version
      save_with_new_params!
      assign_new_latest_version_to_song
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
  
  def clone_current_latest_version
    @latest_version = @song.song_versions.build(@song.latest_version.dup.attributes)
  end
  
  def save_with_new_params!
    @latest_version.assign_attributes(@params)
    @latest_version.assign_attributes(previous_version: @song.latest_version)
    raise ActiveRecord::Rollback unless @latest_version.save
  end
  
  def assign_new_latest_version_to_song
    @song.update(latest_version: @latest_version)
  end
  
  def log_update_action
    @song.disc.album_version.album.log_update(
      @current_user,
      "歌・#{@latest_version.title}",
      @optionals[:description]
    )
  end
end