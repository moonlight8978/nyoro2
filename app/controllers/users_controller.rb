class UsersController < ApplicationController
  before_action :authenticate_user!, only: :current
  before_action :authenticate_user!, :require_moderator, only: :index
  
  def show
    @full_page = true
    
  end
  
  def index
    #code
  end
  
  def current
    @user = current_user
  end
end
