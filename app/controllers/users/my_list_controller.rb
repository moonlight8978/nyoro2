class Users::MyListController < ApplicationController
  def index
    @user = User.find(params[:profile_id])

    respond_to do |format|
      format.html do
        set_title "#{@user.user_name || '無名'}のリスト"

        @ratings = @user.ratings
          .where(rateable_type: 'Db::Album')
        @statistics = StatisticsService::Rating.new(@ratings).perform
      end

      format.js do
        head :bad_request and return unless params[:page].present?

        @ratings = @user.ratings
          .where(rateable_type: 'Db::Album')
          .page(params[:page]).per(50)
        render partial: 'users/my_list/album_list', locals: { ratings: @ratings }
      end
    end
  end
end
