class SearchController < ApplicationController
  def live
    respond_to do |format|
      format.js do
        if search_params?
          @results = search
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

  def search
    query = params[:q].strip.gsub(/\s+/, ' ')
    search = 
      case params[:category]
      when 'album'
        DbQuery::Album
      when 'tag'
        DbQuery::Tag
      when 'staff'
        DbQuery::Album
      end
      .live_search(query)
      
    render_to_string(partial: "search/live_result_#{params[:category]}", locals: { search: search })     
  end
end
