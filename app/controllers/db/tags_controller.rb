class Db::TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :db_sidebar
  
  def index
    @tags = Db::Tag.all
  end
  
  def new
    @tag = Db::Tag.new
  end
  
  def create
    @tag = Db::Tag.create(tag_params)
    
    if @tag.errors.any?
      render action: :new
    else
      @tag.log_create(current_user, @tag.name, params[:description])
      redirect_to @tag
    end
  end
  
  def show
    @tag = Db::Tag.find(params[:id])
  end
  
  def edit
    @tag = Db::Tag.find(params[:id])
    @page_title = @tag.name
    @page_title_en = @tag.name_en
  end
  
  def update
    
    #code
  end
  
  def search
    q = params[:q]
    @search = Db::Tag.search do
      keywords q
    end
      
    @tags = @search.results
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
private
  
  def tag_params
    params.require(:db_tag).permit(
      :name, :name_en, :name_pronounce, :description
    )
  end
end
