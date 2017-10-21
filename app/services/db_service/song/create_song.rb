class DbService::Song::CreateSong
  # OPTIMIZE create service for reusealbe method
  attr_reader :song, :disc, :album, :latest_version

  def initialize(disc_id, params, current_user, **optionals)
    @disc = Db::Disc.find(disc_id)
    @album = @disc.album_versions.first.album
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
    @latest_version = @song.song_versions.build(@params)
    @latest_version.editor = @current_user
    raise ActiveRecord::Rollback unless @latest_version.save
    @song.update(latest_version: @latest_version)
  end

  def log_create_action
    @song.log_create(@current_user, "#{@latest_version.title}", @optionals[:description])
  end
end
