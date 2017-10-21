module Feature::RatingsHelper
  def ratings_for(rateable)
    rated = rateable.ratings.given_by(current_user)
    available_ratings = (1..10).map do |star|
      RatingValue.new(Feature::Rating.new(star: star))
    end
    render 'components/ratings/container',
      rateable: rateable,
      rated: rated,
      available_ratings: available_ratings
  end

  def ratings_graph_for(rateable)
    (rateable.ratings.size > 0) && statistics = StatisticsService::Rating.new(rateable.ratings).perform
    render 'components/ratings/statistics',
      rateable: rateable,
      statistics: statistics
  end
end
