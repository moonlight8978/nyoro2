class DbService::Album::CreateSong
  attr_reader :song, :disc, :album, :latest_version
  
  def initialize(disc_id, params, current_user, **optionals)
    @disc = Db::Disc.find(disc_id)
    @album = @disc.album_versions.last.album
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      create_new_song_with_latest_version!
      log_create_action
    end
  
    self
  end
  
  def errors?
    @latest_version.errors.any?
  end
  
private
  
  def create_new_song_with_latest_version!
    @song = @disc.songs.create
    @latest_version = @song.song_versions.create(@params)
    raise ActiveRecord::Rollback if @latest_version.errors.any?
    @song.update(latest_version: @latest_version)
  end
  
  def log_create_action
    @album.log_create(@current_user, "歌・#{@latest_version.title}", @optionals[:description])
  end
end