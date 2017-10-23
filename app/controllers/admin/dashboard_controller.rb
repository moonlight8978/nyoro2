class Admin::DashboardController < Admin::AdminController
  def statistics
    set_title "統計・アドミンの領域"
    series = [
      { name: :edit, start_day: 6.days.ago, start_month: 5.months.ago },
      { name: :comment, start_day: 6.days.ago }
    ]
    @statistics = StatisticsService::DbLog.perform(series)

    @new_last_week = StatisticsService::LastWeek.perform(:user, :album)
  end
end
