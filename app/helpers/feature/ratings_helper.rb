module Feature::RatingsHelper
  def ratings_for(rateable)
    render 'components/ratings/container', rateable: rateable
  end
  
  def ratings_graph_for(rateable)
    render 'components/ratings/statistics', rateable: rateable
  end
end
