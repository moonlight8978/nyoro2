class DbQuery::Tag
  MODEL = Db::Tag
  PER_PAGE = 1
  
  def self.search(**params)
    MODEL.search do
      fulltext params[:query], 
        fields: [:name, :name_en, :name_pronounce], 
        highlight: true
      paginate page: params[:page], per_page: PER_PAGE
    end
  end
  
  def self.live_search(query)
    MODEL.search do
      fulltext query, 
        fields: [:name, :name_en, :name_pronounce]
      paginate page: 1, per_page: 5
    end
  end
  
  def initialize(relation = MODEL.all)
    @relation = relation
  end
end