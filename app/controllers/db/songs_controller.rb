class Db::SongsController < ApplicationController
  before_action :db_sidebar
  before_action :new_title, only: [:new, :create]
  before_action :authenticate_user!, except: :show
  before_action :require_admin!, only: :destroy
  
  def new
    @disc = Db::Disc.find(params[:disc_id])
    @latest = Db::SongVersion.new
  end
  
  def create
    create_svc = DbService::Album::CreateSong
      .new(params[:disc_id], song_params, current_user, description: params[:description])
      .perform
      
    @disc = create_svc.disc
    @latest = create_svc.latest_version
    
    if create_svc.errors?
      render action: :new
    else
      redirect_to create_svc.album
    end
  end
  
  def show
    @song = Db::Song.find(params[:id])
    @latest = @song.latest_version
    @title = UtilService::PageTitle
      .set "#{@latest.title}・歌"
    @comment = Feature::Comment.new
    @comments = @song.comments.includes(:user).page(1).per(5)
  end
  
  def edit
    @song = Db::Song.find(params[:id])
    @latest = @song.latest_version
    set_ui_variables(@song.latest_version.title, @song.latest_version.title_en)
  end
  
  def update
    update_svc = DbService::Album::UpdateSong
      .new(params[:id], song_params, current_user, description: params[:description])
      .perform
    
    unless update_svc.errors?
      redirect_to update_svc.song
    else
      set_ui_variables(update_svc.page_title, update_svc.page_title_en)
      @song = update_svc.song
      @latest = update_svc.latest_version
      render action: :edit
    end
  end
  
private
  
  def song_params
    params.require(:db_song_version).permit(
      :title, :title_en, :title_pronounce, :length, :number
    )
  end
  
  def new_title
    @title = UtilService::PageTitle.set "新しい歌を作る"
  end
  
  def set_ui_variables(ja, en)
    @title = UtilService::PageTitle
      .set "#{ja}・歌"
    @page_title = ja
    @page_title_en = en
  end
end
