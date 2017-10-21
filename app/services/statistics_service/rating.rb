class StatisticsService::Rating
  def initialize(collection)
    @ratings = collection
  end

  def perform
    grouped = @ratings.group_by(&:star)
    results = { labels: (1..10).to_a }
    results[:data] = results[:labels].map do |star|
      ratings = grouped.detect { |key, ratings| key.to_i == star }
      ratings && ratings[1].size || 0
    end
    results[:average] = @ratings.average(:star)
    results[:votes] = @ratings.size
    results
  end
end
