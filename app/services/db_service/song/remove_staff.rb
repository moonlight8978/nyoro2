class DbService::Song::RemoveStaff
  attr_reader :song
  
  def initialize(song_version_id, staff_id, current_user, **optionals)
    @song_version = Db::SongVersion.find(song_version_id)
    @song = @song_version.song
    @staff = Db::Staff.find(staff_id)
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      user_request_to_update_latest_version!
      create_new_latest_song_version
      remove_request_staff_from_collection_and_assign_to_new_version
      make_new_song_version_as_latest
      log_update_action
    end
    
    self
  end
  
  def errors?
    
  end
  
private
  
  def user_request_to_update_latest_version!
    raise ActiveRecord::Rollback unless @song_version == @song.latest_version
  end
  
  def create_new_latest_song_version
    @song_latest = @song.song_versions.new(@song_version.dup.attributes)
    @song_latest.assign_attributes(
      previous_version: @song.latest_version
    )
    @song_latest.save
  end
  
  def remove_request_staff_from_collection_and_assign_to_new_version
    ids = @song.latest_version.staff_ids - [@staff.id]
    @song_latest.staff_ids = ids
  end
  
  def make_new_song_version_as_latest
    @song.update(latest_version: @song_latest)
  end
  
  def log_update_action
    @song.log_destroy(@current_user, "スタッフ", @optionals[:description])
  end
end