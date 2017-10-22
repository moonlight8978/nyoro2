class DbService::Person::UpdatePerson
  # FIXME form object is more suitable
  attr_reader :person, :latest_version, :name, :name_en

  def initialize(person_id, params, current_user, **optionals)
    @person = Db::Person.find(person_id)
    @latest_version = Db::PersonVersion.new(@person.latest_version.dup.attributes)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    back_up_ui_variables
    return self unless valid?

    ActiveRecord::Base.transaction do
      create_new_latest
      log_update_action
    end

    self
  end

  def errors?
    @latest_version.errors.any?
  end

private

  def valid?
    @latest_version.assign_attributes(@params)
    @latest_version.editor = @current_user
    @latest_version.changed? && @latest_version.valid?
  end

  def back_up_ui_variables
    @name = @latest_version.name
    @name_en = @latest_version.name_en
  end

  def create_new_latest
    svc = DbService::Person::CreatePersonLatest
      .new(user: @current_user, params: @params, person: @person)
      .perform
    @latest_version = svc.latest
  end

  def log_update_action
    @person.log_update(@current_user, @latest_version.name, @optionals[:description])
  end
end
