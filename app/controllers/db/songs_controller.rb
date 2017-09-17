class Db::SongsController < ApplicationController
  before_action :db_sidebar
  
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
  
private
  
  def song_params
    params.require(:db_song_version).permit(
      :title, :title_en, :title_pronounce, :length, :number
    )
  end
end
