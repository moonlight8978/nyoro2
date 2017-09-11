class UsersController < ApplicationController
  before_action :authenticate_user!, only: :update
  before_action :authenticate_user!, :require_moderator, only: :index
  
  def show
    @user = User.find(params[:id])
    @title = UtilService::PageTitle.set("#{@user.user_name || '無名'}さんのプロファイル")
  end
  
  def index
    #code
  end
  
  def update
    @user = current_user
  end
  
  def current
    @user = current_user
    @title = UtilService::PageTitle.set("#{@user.user_name || '無名'}さんのプロファイル")
  end
  
private

  def user_params
    params.require(:user).permit(
      :user_name, :first_name, :last_name, :name_pronounce, :avatar
    )
  end
end
