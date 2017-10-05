class Db::SearchController < ApplicationController
  before_action :db_sidebar, only: :index
  
  def index
    if search_params?
      search_end_title
      @results = search(params[:category], params[:q])
    else
      search_start_title
      @results = nil
    end
    
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
  
  def search_start_title
    set_title "検索しましょう"
    @page_title = "検索..."
    @page_title_en = "Search..."
  end
  
  def search_end_title
    set_title "「#{params[:q]} (#{params[:category]})」の検索結果・ページ#{pagination_page}"
    @page_title = "「#{params[:q]} (#{params[:category]})」の検索結果・ページ #{pagination_page}"
    @page_title_en = "Search results for '#{params[:q]} (#{params[:category]})'"
  end

  def search(category, query)
    query = query.strip.gsub(/\s+/, ' ')
    search = 
      case category
      when 'album'
        DbQuery::Album
      when 'tag'
        DbQuery::Tag
      when 'staff'
        DbQuery::Album
      end
      .search(query: query, page: pagination_page)
      
    render_to_string(partial: "db/search/result_#{category}", locals: { search: search })     
  end
  
  def pagination_page
    params[:page] || 1
  end
end
