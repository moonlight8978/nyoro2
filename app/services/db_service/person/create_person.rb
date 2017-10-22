class DbService::Person::CreatePerson
  # FIXME form object is more suitable
  attr_reader :person, :latest_version

  def initialize(params, current_user, **optionals)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    return self unless valid?

    ActiveRecord::Base.transaction do
      create_new_person
      log_create_action
    end

    self
  end

  def errors?
    @latest_version.errors.any?
  end

private

  def valid?
    @latest_version = Db::PersonVersion.new(@params)
    @latest_version.editor = @current_user
    @latest_version.valid?
  end

  def create_new_person
    svc = DbService::Person::CreatePersonLatest
      .new(user: @current_user, params: @params)
      .perform
    @latest_version = svc.latest
    @person = svc.person
  end

  def log_create_action
    @person.log_create(@current_user, "#{@latest_version.name}", @optionals[:description])
  end
end
