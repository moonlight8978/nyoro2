class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def twitter
    omniauth_callback('twitter')
  end
  
  def facebook
    omniauth_callback('facebook')
  end
  
  def google_oauth2
    omniauth_callback('google_oauth2')
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    super
  end

  # protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end

private

  def omniauth_callback(provider)
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)
    # unless @user
    #   begin
    #     ActiveRecord::Base.transaction do
    #       @user = User.create(
    #         provider: auth.provider, 
    #         uid: auth.uid,
    #         email: auth.info.email,
    #         password: Devise.friendly_token[0, 20]
    #       )
    #       @user.set_default_role
    #     end
    #   rescue ActiveRecord::Rollback
    #     p 'rescue' 
    #   end
    # end
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
