class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_moderator!, only: :index
  
  def show
    @active_tab = params[:tab] || 'info'
    
    if current_user && current_user.id === params[:id].to_i
      @own = true
      @user = current_user
    else
      @own = false
      @user = User.find(params[:id])
    end
    
    set_title "#{@user.user_name || '無名'}さんのプロファイル"
  end
  
  def update
    @user = current_user
    
    @user.assign_attributes(profile_params)
    if @user.changed? && !@user.save
      p 'changed and saving...'
      @own = true
      @active_tab = 'identity_settings'
      render action: :show
    else
      redirect_to profile_path(@user.id, tab: :identity_settings)
    end  
  end
  
  def index
    #code
  end
  
private

  def profile_params
    params.require(:user).permit(
      :user_name, :first_name, :last_name, :name_pronounce, :avatar
      # birthday
    )
  end
end
