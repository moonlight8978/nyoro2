class Db::SongVersionsController < ApplicationController
  # before_action :authenticate_user!
  
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
    #code
  end
  
  def update
    #code
  end
end
