class Users::MyListController < ApplicationController
  def index
    @user = User.find(params[:profile_id])
    set_title "#{@user.user_name || '無名'}のリスト"
    @ratings = @user.ratings
      .includes(album: :latest_version)
      .where(rateable_type: 'Db::Album')
    @statistics = StatisticsService::Rating.new(@ratings).perform
  end
end
