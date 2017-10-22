class DbQuery::Album
  MODEL = Db::Album
  PER_PAGE = 1

  def self.search(**params)
    MODEL.search(include: :latest_version) do
      fulltext params[:query],
        fields: [:title, :title_en, :title_pronounce],
        highlight: true
      paginate page: params[:page], per_page: PER_PAGE
    end
  end

  def self.live_search(query)
    MODEL.search(include: :latest_version) do
      fulltext query,
        fields: [:title, :title_en, :title_pronounce],
        highlight: true
      paginate page: 1, per_page: 5
    end
  end

  def initialize(relation = MODEL.all)
    @relation = relation
  end

  # NOTE query order by avg, count
  def sort(field, direction)
    case field
    when 'rating'
      @relation.includes(latest_version: :release)
        .left_joins(:ratings)
        .select('db_albums.*, avg(feature_ratings.star) as average, count(feature_ratings.id) as votes')
        .group('db_albums.id')
        .order("avg(feature_ratings.star) * 0.7 + count(feature_ratings.id) * 0.3 #{direction}")
    when 'length'

    else
      order_by = DbService::Album::ClassifySortableField
        .perform(order_by: field, direction: direction)
      @relation.includes(latest_version: :release)
        .order(order_by)
    end
  end

private
end
