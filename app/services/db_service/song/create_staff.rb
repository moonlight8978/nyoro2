class DbService::Song::CreateStaff
  attr_reader :song, :latest_version

  def initialize(song_id, params, current_user, **optionals)
    @song = Db::Song.find(song_id)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    ActiveRecord::Base.transaction do
      create_new_version_with_posted_params!
      create_new_staff_with_current_created_version_as_latest
      create_new_latest_song_version
      assign_old_associations_to_new_song_version
      make_new_song_version_as_latest
      append_recent_created_staff_to_new_song_version
      log_update_action
    end

    self
  end

  def errors?
    @latest_version.errors.any?
  end

private

  def create_new_version_with_posted_params!
    @latest_version = Db::StaffVersion.new(@params)
    @latest_version.editor = @current_user
    raise ActiveRecord::Rollback unless @latest_version.save
  end

  def create_new_staff_with_current_created_version_as_latest
    @staff = Db::Staff.create(latest_version: @latest_version)
    @latest_version.update(staff: @staff)
  end

  def create_new_latest_song_version
    @song_latest = @song.song_versions.new(@song.latest_version.dup.attributes)
    @song_latest.assign_attributes(
      previous_version: @song.latest_version
    )
    @song_latest.save
  end

  def assign_old_associations_to_new_song_version
    @song_latest.staff_ids = @song.latest_version.staff_ids
  end

  def make_new_song_version_as_latest
    @song.update(latest_version: @song_latest)
  end

  def append_recent_created_staff_to_new_song_version
    @song_latest.staffs << @staff
  end

  def log_update_action
    @song.log_create(@current_user, "スタッフ", @optionals[:description])
  end
end
