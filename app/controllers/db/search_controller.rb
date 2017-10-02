class Db::SearchController < ApplicationController
  before_action :db_sidebar, only: :index
  
  def index
    set_title '検索'
  end
  
  def result
    results = search(params[:category], params[:q])
    respond_to do |format|
      format.html
      format.js { render plain: results }
    end
  end
  
private

  def search(category, query)
    query = query.strip.gsub(/\s+/, ' ')
    case category
    when 'album'
      search = Db::Album.search(include: :latest_version) do
        fulltext query, 
          fields: [:title, :title_en, :title_pronounce], 
          highlight: true
      end
      render_to_string(partial: 'db/search/result', locals: { search: search })
    when 'tag'
      
    when 'staff'
      
    end      
  end
end
