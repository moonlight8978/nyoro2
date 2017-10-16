module Feature::RatingsHelper
  def ratings_for(rateable)
    if user_signed_in?
      rated = rateable.ratings.find_by(user_id: current_user.id) || Feature::Rating.new
      rated_star = rated.star || '-'
    end
    render 'components/ratings/container', rateable: rateable, rated_star: rated_star, rated: rated
  end
  
  def ratings_graph_for(rateable)
    render 'components/ratings/statistics', rateable: rateable
  end
end
