class Db::Albums::TagsController < ApplicationController
  def create
    p tag_params
  end
  
  def destroy
    #code
  end
  
private

  def tag_params
    params.fetch(:db_tag, {}).permit(tag_ids: [])
  end
end
