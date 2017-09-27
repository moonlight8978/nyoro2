class DbService::Album::CreateAlbum
  attr_reader :latest_version, :album
  
  def initialize(params, current_user, **optionals)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      create_new_album
      create_new_version_as_album_latest_version!
      assign_latest_version_to_album
      log_create_action
    end
  
    self
  end
  
  def errors?
    @album.errors.any? || @latest_version.errors.any?
  end
  
private
  
  def create_new_album
    @album = Db::Album.create
  end
  
  def create_new_version_as_album_latest_version!
    @latest_version = @album.album_versions.build(@params)
    # @latest_version.previous_version = @album.latest_version
    raise ActiveRecord::Rollback unless @latest_version.save
  end
  
  def assign_latest_version_to_album
    @album.update(latest_version: @latest_version)
  end
  
  def log_create_action
    @album.log_create(@current_user, @params[:title], @optionals[:description])
  end
end