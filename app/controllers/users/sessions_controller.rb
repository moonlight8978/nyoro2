class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    set_title 'ログイン'
    @full_page = true
    @no_footer = true
    super
  end

  # POST /resource/sign_in
  def create
    set_title 'ログイン'
    @full_page = true
    @no_footer = true
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  
  def after_sign_in_path_for(resource)
    stored_location_for(:user) || home_path
  end
  
  def after_sign_out_path_for(resource)
    stored_location_for(:user) || home_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
