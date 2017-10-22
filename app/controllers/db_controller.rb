class DbController < ApplicationController
  before_action :db_sidebar

  def index
    @title = UtilService::PageTitle.set('データベース')
    @albums = Db::Album.includes(:latest_version).all
    @people = Db::Person.includes(:latest_version).all
    @companies = Db::Company.includes(:latest_version).all
    @tags = Db::Tag.all
  end
end
