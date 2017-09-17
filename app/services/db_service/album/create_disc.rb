class DbService::Album::CreateDisc
  attr_reader :latest_version, :album, :disc
  
  def initialize(album_id, params, current_user, **optionals)
    @album = Db::Album.includes(:latest_version).find(album_id)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      clone_latest_version
      create_new_disc!
      log_create_action
    end
  
    self
  end
  
  def errors?
    @disc.errors.any?
  end
  
private

  def clone_latest_version
    @latest_version = @album.album_versions
      .build(@album.latest_version.dup.attributes)
    @latest_version.update(
      previous_version: @album.latest_version,
      image: @album.latest_version.image
    )
    @album.update(latest_version: @latest_version)
  end
  
  def create_new_disc!
    @disc = @latest_version.discs.build(@params)
    raise ActiveRecord::Rollback unless @disc.save
  end
  
  def log_create_action
    @album.log_create(
      @current_user, 
      "ディスク#{@disc.number}・#{latest_version.title}", 
      @optionals[:description]
    )
  end
end