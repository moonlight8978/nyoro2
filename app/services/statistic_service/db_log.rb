module StatisticService::DbLog
  attr_reader :results
  
  def self.perform(series)
    @results = {}
    
    series.each do |seri|
      if seri[:start_day].present?
        chart_data_by_day(seri[:name], seri[:start_day])
      end
      
      if seri[:start_month].present? 
        chart_data_by_month(seri[:name], seri[:start_month])
      end
    end
    
    @results
  end
  
private
  
  def self.group_log(seri)
    case seri
    when :edit
      Feature::Log.db_edit
    when :create
      Feature::Log.db_create
    when :comment
      Feature::Log.db_comment
    end
  end
  
  def self.chart_data_by_day(seri, start_time)
    seri_name = "#{seri}_day".to_sym
    grouped = group_log(seri)
    
    grouped = grouped
      .where("created_at >= ?", start_time.at_beginning_of_day)
      .group_by_day(&:created_at)
    
    @results[seri_name] = {}
    
    @results[seri_name][:data] = (start_time.to_date..Date.today).map do |date|
      log = grouped.detect { |group_date, logs| group_date == date }
      log && log[1].size || 0
    end
    
    @results[seri_name][:labels] = (start_time.to_date..Date.today).map do |date|
      date.strftime('%-m月%d日')
    end
  end
  
  def self.chart_data_by_month(seri, start_time)
    seri_name = "#{seri}_month".to_sym
    months = (start_time.to_date..Date.today).map { |date| date.strftime("%Y月%-m日") }.uniq
    
    grouped = group_log(seri)
      .where("created_at >= ?", start_time.at_beginning_of_month)
      .group_by_month(&:created_at)
    
    @results[seri_name] = {}
    
    @results[seri_name][:data] = months.map do |month|
      log = grouped.detect { |group_date, logs| group_date.strftime("%Y月%-m日") == month }
      log && log[1].size || 0
    end
    
    @results[seri_name][:labels] = months
  end
end