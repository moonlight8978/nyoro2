class DbService::Person::CreatePersonLatest
  # OPTIMIZE create service for reusealbe method
  def initialize(params, current_user, **optionals)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    ActiveRecord::Base.transaction do
      create_db_person_version!
      create_person_with_recent_created_version_as_latest
      log_create_action
    end

    self
  end

private

  def create_db_person_version!
    @latest_version = Db::PersonVersion.new(@params)
    @latest_version.editor = @current_user
    raise ActiveRecord::Rollback unless @latest_version.save
  end

  def create_person_with_recent_created_version_as_latest
    @person = Db::Person.create(latest_version: @latest_version)
    @latest_version.update(person: @person)
  end

  def log_create_action
    @person.log_create(@current_user, "#{@latest_version.name}", @optionals[:description])
  end
end
