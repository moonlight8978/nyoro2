class Feature::RatingsController < ApplicationController
  before_action :authenticate_user!, :find_rateable
  
  def create
    rate_svc = FeatureService::Rate.new(
      rateable: @rateable, 
      current_user: current_user,
      star: rating_params[:star]
    )
  end
  
  def update
    #code
  end
  
private
  
  def find_rateable
    @rateable ||= rateable_class.find(params[:rateable_id])
  end
  
  def rateable_class
    params[:rateable_type].constantize
  end
  
  def rating_params
    params.require(:feature_rating).permit(:star)
  end
end
