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
end