class DbController < ApplicationController
  before_action :db_sidebar
  
  def index
    @title = UtilService::PageTitle.set('データベース')
    @albums = Db::Album.includes(:latest_version).all
  end
end
