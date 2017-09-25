class Db::Albums::TagsController < ApplicationController
  def create
    @album = Db::Album.find(params[:album_id])
    ids = params[:tag_ids].uniq
    @album.tag_ids = ids
    
    redirect_to @album
  end
  
  def destroy
    #code
  end
  
private

  def tag_params
    params.fetch(:db_tag, {}).permit(tag_ids: [])
  end
end
