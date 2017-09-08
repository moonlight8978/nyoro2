class UtilitiesController < ApplicationController
  def nsfw
    # true => show nsfw images
    # false => hide nsfw images
    session[:nsfw] = !session[:nsfw]
    redirect_back fallback_location: '/home'
  end
end
