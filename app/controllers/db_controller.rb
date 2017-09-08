class DbController < ApplicationController
  before_action :db_sidebar
  
  def index
    @title = UtilService::PageTitle.set('データベース')
  end
end
