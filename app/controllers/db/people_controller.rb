class Db::PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :db_sidebar
  
  def new
    set_title :'新しいスタッフを作る'
    @latest = Db::PersonVersion.new
  end
  
  def create
    set_title :'新しいスタッフを作る'
    #code
  end
  
  def show
    #code
  end
  
  def update
    #code
  end
  
  def index
    set_title :'スタッフリスト'
    #code
  end
  
  def destroy
    #code
  end
end
