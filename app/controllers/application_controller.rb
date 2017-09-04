class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
  
  def current_user
    @current_user ||= super && User.eager_load(:roles).find(@current_user.id)
  end
  
  def after_sign_in_path_for(resource)
    db_albums_path
  end
end
