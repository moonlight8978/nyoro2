class Db::SongVersions::StaffsController < ApplicationController
  before_action :authenticate_user!
  
  def destroy
    remove_svc = DbService::Song::RemoveStaff
      .new(params[:song_version_id], params[:id], current_user, description: params[:description])
      .perform
    
    redirect_to remove_svc.song
  end
end
