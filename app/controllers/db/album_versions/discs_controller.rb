class Db::AlbumVersions::DiscsController < ApplicationController
  def destroy
    remove_svc = DbService::Album::RemoveDisc
      .new(params[:album_version_id], params[:id], current_user, description: params[:description])
      .perform
    
    redirect_to remove_svc.album
  end
end
