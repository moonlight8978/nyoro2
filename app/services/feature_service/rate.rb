class FeatureService::Rate
  attr_reader :rating
  
  # :rateable*, :current_user*, :star*
  def initialize(**options)
    @rateable, @current_user = 
      options[:rateable], options[:current_user]
    @star = options[:star] || nil
    @rating = @rateable.ratings.find_by(user_id: @current_user.id)
  end
  
  def perform
    create_rating_if_not_exist
    update_rating
  end
  
private

  def create_rating_if_not_exist
    @rating ||= @rateable.ratings.new(user: user, star: @star)
  end
  
  def update_rating
    @rating.update(star: @star)
  end
end