class Db::SongVersionsController < ApplicationController
  before_action :authenticate_user!
  before_action :db_sidebar
  
  def index
    @song = Db::Song
      .includes(:latest_version)
      .find(params[:song_id])
    @title = UtilService::PageTitle.set "#{@song.latest_version.title}の編集履歴"
    @versions = @song.versions
      .page(params[:page] || 1).per(params[:per] || 20)
      .group_by_day(&:created_at)
  end
  
  def show
    # This is not global latest version. 
    # Just because it shares template with song's page
    # Will fix soon
    @latest = Db::SongVersion
      .includes(:song)
      .find(params[:id])
    @song = @latest.song
    @title = UtilService::PageTitle
      .set "#{@song.latest_version.title}・バージョン#{params[:id]}"
  end
  
  def update
    @song = Db::Song.find(params[:song_id])
    
    if (@song.latest_version_id === params[:id].to_i)
      redirect_to db_song_versions_path(@song) and return
    end
    
    @version = Db::SongVersion.find(params[:id])
    
    if (@version.song_id === params[:song_id].to_i)
      @song.update(latest_version_id: params[:id])
      @song.log_update(current_user, @version.title, "バーション#{params[:id]}に戻す。")
    end
    
    redirect_to db_song_versions_path(@song)
  end
end
