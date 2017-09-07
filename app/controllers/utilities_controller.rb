class UtilitiesController < ApplicationController
  def nsfw
    # true => show nsfw images
    # false => hide nsfw images
    session[:nsfw] = !session[:nsfw]
  end
end
