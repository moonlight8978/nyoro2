class DbService::Album::CreateAlbum
  attr_reader :latest_version, :album

  def initialize(params, current_user, **optionals)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    ActiveRecord::Base.transaction do
      create_new_version_as_album_latest_version!
      create_new_album_represent_latest
      log_create_action
    end
    p @latest_version.errors
    self
  end

  def errors?
    @latest_version.errors.any?
  end

private
  def create_new_version_as_album_latest_version!
    @latest_version = Db::AlbumVersion.new(@params)
    @latest_version.editor = @current_user
    raise ActiveRecord::Rollback unless @latest_version.save
  end

  def create_new_album_represent_latest
    @album = Db::Album.create(latest_version: @latest_version)
    @latest_version.update(album: @album)
  end

  def log_create_action
    @album.log_create(@current_user, @params[:title], @optionals[:description])
  end
end
