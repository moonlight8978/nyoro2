class StatisticsService::Rating
  def initialize(rateable)
    @rateable = rateable
  end
  
  def perform
    grouped = @rateable.ratings.group_by(&:star)
    results = { labels: (1..10).to_a }
    results[:data] = results[:labels].map do |star|
      ratings = grouped.detect { |key, ratings| key.to_i == star }
      ratings && ratings[1].size || 0
    end
    results
  end
end