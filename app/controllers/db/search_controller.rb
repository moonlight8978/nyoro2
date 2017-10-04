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
    case category
    when 'album'
      search = Db::Album.search(include: :latest_version) do
        fulltext query, 
          fields: [:title, :title_en, :title_pronounce], 
          highlight: true
        paginate page: params[:page] || 1, per_page: 1
      end
    when 'tag'
      search = Db::Tag.search do
        fulltext query, 
          fields: [:name, :name_en, :name_pronounce], 
          highlight: true
        paginate page: params[:page] || 1, per_page: 1
      end
    when 'staff'
      search = Db::Person.search(include: :latest_version) do
        fulltext query, 
          fields: [:name, :name_en, :name_pronounce, :website, :twitter], 
          highlight: true
        paginate page: params[:page] || 1, per_page: 1
      end
    end 
    render_to_string(partial: "db/search/result_#{category}", locals: { search: search })     
  end
  
  def pagination_page
    params[:page] || 1
  end
end
