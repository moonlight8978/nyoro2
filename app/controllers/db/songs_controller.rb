class Db::SongsController < ApplicationController
  before_action :db_sidebar
  before_action :authenticate_user!, except: :show
  before_action :require_admin!, only: :destroy
  
  def new
    set_title "新しい歌を作る"
    @disc = Db::Disc.find(params[:disc_id])
    @latest = Db::SongVersion.new
  end
  
  def create
    set_title "新しい歌を作る"
    create_svc = DbService::Song::CreateSong
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
    @song = Db::Song
      .includes(latest_version: { staffs: { latest_version: { person: :latest_version } } })
      .find(params[:id])
    @latest = @song.latest_version
    @staffs = @latest.staffs_group_by_position
    set_title "#{@latest.title}"
    @comments = @song.comments.includes(:user).page(1).per(5)
  end
  
  def edit
    @song = Db::Song.find(params[:id])
    @latest = @song.latest_version
    set_ui_variables(@song.latest_version.title, @song.latest_version.title_en)
  end
  
  def update
    update_svc = DbService::Song::UpdateSong
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
  
  def destroy
    #code
  end
  
private
  
  def song_params
    params.require(:db_song_version).permit(
      :title, :title_en, :title_pronounce, :length, :number
    )
  end
  
  def set_ui_variables(ja, en)
    set_title "#{ja}・歌"
    @page_title = ja
    @page_title_en = en
  end
end
