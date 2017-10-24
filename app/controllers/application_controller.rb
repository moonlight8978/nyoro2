class ApplicationController < ActionController::Base
  before_action :store_user_location, if: :storable_location?
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

protected

  def current_user
    @current_user ||= super && User.eager_load(:roles).find(@current_user.id)
  end

  def require_admin!
    permission_denied unless current_user.is_admin?
  end

  def require_moderator!
    permission_denied unless current_user.is_moderator?
  end

  def db_sidebar
    @sidebar = :db
    @logs = Feature::Log.db_log.page(1).per(5)
  end

  def set_title(title)
    @title = UtilService::PageTitle.set(title)
  end

private

  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def permission_denied
    # need to be 401
    render file: "public/422.html", status: :unauthorized
  end

  # Its important that the location is NOT stored if:
  # - The request method is not GET (non idempotent)
  # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
  #    infinite redirect loop.
  # - The request is an Ajax request as this can lead to very unexpected behaviour.
  def storable_location?
    request.get? && !devise_controller? && !request.xhr?
  end

  def store_user_location
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
