class Admin::DashboardController < ApplicationController
  layout 'admin'
  
  def statistics
    @labels = (6.months.ago.to_date..Date.today).map { |e| "#{e.year}-#{e.month}" }.uniq
    @logs_grouped = Feature::Log.all.group_by_month(&:created_at).map do |day, logs| 
      { month: day.strftime("%Y-%-m"), logs: logs.size }
    end
    
    @count = @labels.map do |label|
      log = @logs_grouped.detect { |log| log[:month] == label }
      log && log[:logs] || 0
    end
    
    @log_grouped = Feature::Log.where("created_at >= ?", 6.days.ago.at_beginning_of_day).group_by_day(&:created_at)
    @log_count = (6.days.ago.to_date..Date.today).map do |date|
      log = @log_grouped.detect { |group_date, logs| group_date == date }
      log && log[1].size || 0
    end
    p @log_count
    @log_labels = (6.days.ago.to_date..Date.today).map do |e|
      e.strftime('%-m月%d日')
    end
  end
end
