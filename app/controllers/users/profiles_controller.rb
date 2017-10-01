class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_moderator!, only: :index
  
  def show
    @active_tab = params[:tab] || 'info'
    set_authorities(params[:id])
    set_title "#{@user.user_name || '無名'}さんのプロファイル"
    case @active_tab
    when 'info'
      perform_info
    when 'recent_activities'
      perform_recent_activities
    when 'identity_settings'
      perform_identity_settings
    when 'security_settings'
      perform_security_settings
    end
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
  
  def set_authorities(user_id)
    @user = User.find(user_id)
    @own = user_signed_in? && @user == current_user
  end
  
  def perform_info
    #code
  end
  
  def perform_recent_activities
    log_query = LogQuery.new(per_page: 5)
    @log_comments = log_query.comment(@user)
    @log_edit = log_query.db_edit(@user)
    series = [
      { name: :comment, start_day: 6.days.ago },
      { name: :edit, start_day: 6.days.ago }
    ]
    @statistics = StatisticsService::DbLog.perform(series, @user)
    p @statistics
  end
  
  def perform_identity_settings
    #code
  end
  
  def perform_security_settings
    #code
  end
end
