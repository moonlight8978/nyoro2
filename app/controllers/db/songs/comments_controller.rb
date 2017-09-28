class Db::Songs::CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  
  def index
    @song = Db::Song.find(params[:song_id])
    
    @comments = @song.comments.includes(:user)
      .page(params[:page] || 1)
      .per(params[:per_page] || 5)
    
    respond_to do |format|
      format.json { render json: @comments }
      format.js do
        if @comments.any?
          render partial: 'components/comments/list', 
            locals: { commentable: @song, comments: @comments }
        else 
          head :bad_request
        end
      end
    end
  end
  
  def create
    @song = Db::Song.find(params[:song_id])
      
    @comment = @song.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      @song.log_comment(current_user, @song.latest_version.title, params[:description])
      redirect_to @song
    else
      
    end
  end
  
  def destroy
    #code
  end
  
  def update
    #code
  end
  
private
  
  def comment_params
    params.require(:feature_comment).permit(:body)
  end
end
