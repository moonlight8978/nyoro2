class Admin::DashboardController < ApplicationController
  layout 'admin'
  
  def statistics
    @labels = (6.months.ago.to_date..Date.today).map { |e| "#{e.year}-#{e.month}" }.uniq
    @logs_grouped = Feature::Log.all.group_by_month(&:created_at).map do |day, logs| 
      { month: day.strftime("%Y-%-m"), logs: logs.size }
    end
    
    @count = @labels.map do |label|
      log = @logs_grouped.detect { |log| log[:month] == label }
      p log
      log && log[:logs] || 0;
    end
  end
end
