module StatisticsService::LastWeek
  def self.perform(*series)
    @results = {}
    
    series.each do |seri|
      count_new_entry_last_week(seri)
    end
    
    @results
  end
  
private
  
  def self.count_new_entry_last_week(seri)
    @results[seri] = classify(seri)
      .where("created_at >= ?", Date.today.at_beginning_of_week.at_beginning_of_day)
      .size
  end
  
  def self.classify(seri)
    case seri
    when :user
      User
    when :album
      Db::Album
    when :person
      Db::Person
    when :product
      
    end
  end
end