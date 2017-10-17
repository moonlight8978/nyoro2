class FeatureService::Rate
  # :rateable*, :current_user*, :star*
  def initialize(**options)
    @rateable, @user = 
      options[:rateable], options[:user]
    @star = options[:star].to_i || nil
    @rating = @rateable.ratings.find_by(rated_user: @user)
  end
  
  def perform
    if @star == 0 || @star.nil?
      @rating.present? && delete_rating
    elsif
      create_rating_if_not_exist
      update_rating
    end
    
    self
  end
  
  def response
    { user: @rateable.ratings.given_by(@user).to_s,
      avg: @rateable.ratings.average(:star) }
  end
  
private

  def delete_rating
    @rating.destroy
  end
  
  def create_rating_if_not_exist
    @rating ||= @rateable.ratings.new(rated_user: @user, star: @star)
  end
  
  def update_rating
    @rating.update(star: @star)
  end
end