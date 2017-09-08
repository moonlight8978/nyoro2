class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :configure_permitted_parameters, if: :devise_controller?
  
protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, 
      keys: [:user_name, :first_name, :last_name, :name_pronounce, :avatar]
    )
  end
  
  def current_user
    @current_user ||= super && User.eager_load(:roles).find(@current_user.id)
  end
  
  def after_sign_in_path_for(resource)
    db_albums_path
  end
  
  def require_admin!
    permission_denied unless current_user.is_admin?
  end
  
  def require_moderator!
    permission_denied unless current_user.is_moderator?
  end
  
  def db_sidebar
    @sidebar = :db
    @logs = Feature::Log.db_log.page(1).per(10)
  end
  
private 

  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
  
  def permission_denied
    # need to be 401
    render file: "public/422.html", status: :unauthorized
  end
end
