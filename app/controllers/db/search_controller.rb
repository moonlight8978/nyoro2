class Db::SearchController < ApplicationController
  before_action :db_sidebar, only: :index
  
  def index
    set_title '検索'
    @results = search_params? ? search(params[:category], params[:q]) : nil
    
    respond_to do |format|
      format.html
      format.js do
        if @results
          render plain: @results, status: :ok
        else
          head :bad_request
        end
      end
    end
  end
  
private

  def search_params?
    params[:category].present? && params[:q].present?
  end

  def search(category, query)
    query = query.strip.gsub(/\s+/, ' ')
    case category
    when 'album'
      search = Db::Album.search(include: :latest_version) do
        fulltext query, 
          fields: [:title, :title_en, :title_pronounce], 
          highlight: true
        paginate page: params[:page] || 1, per_page: 1
      end
      render_to_string(partial: 'db/search/result', locals: { search: search })
    when 'tag'
      
    when 'staff'
      
    end      
  end
end
