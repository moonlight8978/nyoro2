class Admin::DashboardController < ApplicationController
  layout 'admin'
  
  def statistics
    series = [
      { name: :edit, start_day: 6.days.ago, start_month: 5.months.ago },
      { name: :comment, start_day: 6.days.ago }
    ]
    @statistics = StatisticService::DbLog.perform(series)
    
    @new_albums = Db::Album.where("created_at >= ?", Date.today.at_beginning_of_week.at_beginning_of_day).size
    @new_users = User.where("created_at >= ?", Date.today.at_beginning_of_week.at_beginning_of_day).size
  end
end
