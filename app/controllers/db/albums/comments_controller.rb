class Db::Albums::CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  
  def index
    @album = Db::Album.find(params[:album_id])
    
    @comments = @album.comments.includes(:user)
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)
      
    respond_to do |format|
      format.html
      format.json { render json: @comments }
      format.js
    end
  end
  
  def create
    @album = Db::Album.find(params[:album_id])
      
    @comment = @album.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to @album
    else
      
    end
  end
  
private
  
  def comment_params
    params.require(:feature_comment).permit(:body)
  end
end