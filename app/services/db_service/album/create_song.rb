class DbService::Album::CreateSong
  attr_reader :song, :disc, :album, :latest_version
  
  def initialize(disc_id, params, current_user, **optionals)
    @disc = Db::Disc.find(disc_id)
    @album = @disc.album_version.album
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      @song = @disc.songs.create
      @latest_version = @song.song_versions.create(@params)
      raise ActiveRecord::Rollback if @latest_version.errors.any?
      @song.update(latest_version: @latest_version)
      @album.log_create(@current_user, "歌・#{@latest_version.title}", @optionals[:description])
    end
  
    self
  end
  
  def errors?
    @latest_version.errors.any?
  end
  
private

end