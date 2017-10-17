class Feature::RatingsController < ApplicationController
  before_action :authenticate_user!, :find_rateable
  
  def create
    rate_svc = FeatureService::Rate
      .new(
        rateable: @rateable, 
        user: current_user,
        star: rating_params[:star]
      )
      .perform
      
    respond_to do |format|
      format.js { render json: rate_svc.response }
    end
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
