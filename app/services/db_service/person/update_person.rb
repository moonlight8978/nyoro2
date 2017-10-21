class DbService::Person::UpdatePerson
  attr_reader :person, :latest_version, :name, :name_en

  def initialize(person_id, params, current_user, **optionals)
    @person = Db::Person.find(person_id)
    @latest_version = @person.latest_version
    @params = params
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    back_up_ui_variables
    ActiveRecord::Base.transaction do
      check_if_user_made_any_changes!
      create_new_version!
      make_recent_created_version_as_latest
      log_update_action
    end

    self
  end

  def errors?
    @latest_version.errors.any?
  end

private

  def back_up_ui_variables
    @name = @latest_version.name
    @name_en = @latest_version.name_en
  end

  def check_if_user_made_any_changes!
    @latest_version.assign_attributes(@params)
    raise ActiveRecord::Rollback unless @latest_version.changed?
  end

  def create_new_version!
    @latest_version = Db::PersonVersion.new(@latest_version.dup.attributes)
    @latest_version.assign_attributes(
      person: @person,
      previous_version: @person.latest_version,
      editor: @current_user
    )
    raise ActiveRecord::Rollback unless @latest_version.save
  end

  def make_recent_created_version_as_latest
    @person.update(latest_version: @latest_version)
  end

  def log_update_action
    @person.log_update(@current_user, @latest_version.name, @optionals[:description])
  end
end
