class Db::AlbumsController < ApplicationController
  before_action :db_sidebar, only: [:show, :index]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  
  def new
    @title = UtilService::PageTitle.set '新しいアルバムを作る'
    @album = Db::Album.new
  end
  
  def create
    @title = UtilService::PageTitle.set '新しいアルバムを作る'
    @album = Db::Album.create(album_params)
    
    unless @album.errors.any?
      log = @album.log_create(current_user, @album.title, params[:description])
      redirect_to @album
    else
      render 'new'
    end
  end
  
  def show
    @album = Db::Album.find(params[:id])
    @title = UtilService::PageTitle.set @album.title
    @comment = Feature::Comment.new
    @comments = @album.comments.eager_load(:user).page(1).per(5)
  end
  
  def index
    @title = UtilService::PageTitle.set 'アルバムリスト'
    _order = params[:sort].present? ? params[:sort] : :title_pronounce
    _direction = params[:reverse_sort].present? ? :desc : :asc
    
    @albums = Db::Album.all
      .order(_order => _direction)
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)
      
    respond_to do |format|
      format.html
      format.js 
      format.json { render json: @albums, status: :ok }
    end
  end
  
  def edit
    @album = Db::Album.find(params[:id])
    @title = UtilService::PageTitle.set "#{@album.title}を直す"
    @album_title = @album.title
  end
  
  def update
    @album = Db::Album.find(params[:id])
    @title = UtilService::PageTitle.set "#{@album.title}を直す"
    @album_title = @album.title
    @album.assign_attributes(album_params)
    
    # (render plain: '何も変わらなかった。' and return) unless @album.changed?
    
    if @album.save
      log = @album.log_update(current_user, @album.title, params[:description])
      redirect_to @album
    else
      render 'edit'
    end
  end
  
  def destroy
    @album = Db::Album.find(params[:id])
    @title = UtilService::PageTitle.set "#{@album.title}を消す"
    log = @album.log_destroy(current_user, @album.title, params[:description])
    @album.destroy
    redirect_to db_albums_path
  end
  
  def search
    @title = UtilService::PageTitle.set "Search results for #{params[:q]}"
    search = Db::Album.search do
      keywords params[:q], highlight: true
      order_by(:title_pronounce, :asc)
      paginate(page: params[:page] || 1, per_page: params[:per_page] || 10)
    end
    
    @albums = search.results
    
    respond_to do |format|
      format.html
      format.js do 
        render partial: 'components/livesearch', locals: {
          results: @albums, no_img: false
        } 
      end
    end
  end

private

  def album_params
    params.require(:db_album).permit(
      :title, :title_en, :title_pronounce, :image
    )
  end
  
  def render_logs
    logs = Feature::Log.db_log.page(1).per(10)
    render_to_string partial: 'components/logs', locals: { logs: logs }
  end
end