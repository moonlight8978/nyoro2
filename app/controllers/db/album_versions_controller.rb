class Db::AlbumVersionsController < ApplicationController
  before_action :db_sidebar
  before_action :authenticate_user!, only: [:update]
  
  def index
    @album = Db::Album
      .includes(:latest_version)
      .find(params[:album_id])
    @title = UtilService::PageTitle.set "#{@album.latest_version.title}の編集履歴"
    @versions = @album.versions
      .page(params[:page] || 1).per(params[:per] || 20)
      .group_by_day(&:created_at)
  end
  
  def show
    @latest = Db::AlbumVersion
      .includes(:album, discs: { songs: [:latest_version] })
      .find(params[:id])
    @album = @latest.album
    @title = UtilService::PageTitle
      .set "#{@album.latest_version.title}・バージョン#{params[:id]}"
  end
  
  # to revert / edit current latest_version of album
  def update
    @album = Db::Album.find(params[:album_id])
    
    if (@album.latest_version_id === params[:id].to_i)
      redirect_to db_album_versions_path and return
    end
    
    @version = Db::AlbumVersion.find(params[:id])
    
    if (@version.album_id === params[:album_id].to_i)
      @album.update(latest_version_id: params[:id])
      @album.log_update(current_user, @version.title, "バーション#{params[:id]}に戻す。")
    end
    
    redirect_to db_album_versions_path
  end
end
