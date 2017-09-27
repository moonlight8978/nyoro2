class DbService::Song::UpdateStaff
  attr_reader :song, :latest_version
  
  def initialize(staff_id, params, current_user, **optionals)
    @staff = Db::Staff.find(staff_id)
    @song = @staff.song_versions.last.song
    @latest_version = @staff.latest_version
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    ActiveRecord::Base.transaction do
      check_if_user_made_any_changes!
      create_new_staff_version!
      make_new_version_as_default
      log_update_action
    end
    
    self
  end
  
  def errors?
    @latest_version.errors.any?
  end
  
private
  
  def check_if_user_made_any_changes!
    @latest_version.assign_attributes(@params)
    raise ActiveRecord::Rollback unless @latest_version.changed?
  end
  
  def create_new_staff_version!
    @latest_version = Db::StaffVersion.new(@latest_version.dup.attributes)
    @latest_version.assign_attributes(previous_version: @staff.latest_version)
    raise ActiveRecord::Rollback unless @latest_version.save
  end
  
  def make_new_version_as_default
    @staff.update(latest_version: @latest_version)
  end
  
  def log_update_action
    @song.log_update(@current_user, "スタッフ", @optionals[:description])
  end
end