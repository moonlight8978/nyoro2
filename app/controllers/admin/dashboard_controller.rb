class Admin::DashboardController < ApplicationController
  layout 'admin'
  
  def statistics
    series = [
      { name: :edit, start_day: 6.days.ago, start_month: 5.months.ago },
      { name: :comment, start_day: 6.days.ago }
    ]
    @statistics = StatisticService::DbLog.perform(series)
    
    @new_last_week = StatisticService::LastWeek.perform(:user, :album)
  end
end
