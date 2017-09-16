class Db::AlbumVersionsController < ApplicationController
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
    @version = Db::AlbumVersion
      .includes(:album)
      .find(params[:id])
    @album = @version.album
  end
end
