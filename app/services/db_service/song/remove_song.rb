class DbService::Song::RemoveSong
  attr_reader :song, :disc, :album, :latest_version
  
  def initialize(disc_id, params, current_user, **optionals)
  end
  
  def perform
    ActiveRecord::Base.transaction do
    end
    
    self
  end
  
  def errors?
    @latest_version.errors.any?
  end
  
private
  
  def create_new_song_with_latest_version!
    
  end
  
  def log_create_action
  end
end