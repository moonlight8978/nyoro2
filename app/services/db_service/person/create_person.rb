class DbService::Person::CreatePerson
  attr_reader :person, :latest_version
  
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
  
  def errors?
    @latest_version.errors.any?
  end
  
private
  
  def create_db_person_version!
    @latest_version = Db::PersonVersion.create(@params)
    raise ActiveRecord::Rollback if errors?
  end
  
  def create_person_with_recent_created_version_as_latest
    @person = Db::Person.create(latest_version: @latest_version)
    @latest_version.update(person: @person)
  end
  
  def log_create_action
    @person.log_create(@current_user, "#{@latest_version.name}", @optionals[:description])
  end
end