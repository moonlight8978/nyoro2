class DbService::Person::CreatePersonLatest
  attr_reader :person, :latest
  # allow :user, :params
  def initialize(**args)
    @user, @params, @person = args[:user], args[:params], args[:person]
  end

  def perform
    build_latest
    @person || build_person_with_latest
    assign_associations

    self
  end

private

  def build_latest
    params = @params || @person.latest_version.dup.attributes
    @latest = Db::PersonVersion.new(params)
    @latest.editor = @user
    @latest.save
  end

  def build_person_with_latest
    @person = Db::Person.create(latest_version: @latest)
  end

  def assign_associations
    @person.update(latest_version: @latest)
    @latest.update(
      previous_version: @person.latest_version,
      person: @person
    )
  end
end
