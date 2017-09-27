class DbService::Tag::CreateTag
  attr_reader :tag
  
  def initialize(params, current_user, **optionals)
    @params = params
    @current_user = current_user
    @optionals = optionals
  end
  
  def perform
    @tag = Db::Tag.create(@params)
  end
  
  def errors?
    @tag.errors.any?
  end
end