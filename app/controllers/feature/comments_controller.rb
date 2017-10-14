class Feature::CommentsController < ApplicationController
  def index
    @comments = Feature::Comment.includes(:user)
      .where(
        commentable_type: params[:commentable_type], 
        commentable_id: params[:commentable_id]
      )
      .page(params[:page] || 1)
      .per(params[:per_page] || 5)
    
    respond_to do |format|
      format.json { render json: @comments }
      format.js do
        if @comments.any?
          render partial: 'components/comments/list', 
            locals: { commentable: @album, comments: @comments }
        else 
          head :bad_request
        end
      end
    end
  end
  
  def create
    commentable = params[:commentable_type].constantize.find(params[:commentable_id])
    
    @comment = commentable.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      @comment.log_comment(current_user, commentable.title, params[:description])
      redirect_to commentable
    else
      
    end
  end

private

  def comment_params
    params.require(:feature_comment).permit(:body)
  end
  
  def find_commentable
    @comments = Feature::Comment.includes(:user)
      .where(
        commentable_type: params[:commentable_type], 
        commentable_id: params[:commentable_id]
      )
      .page(params[:page] || 1)
      .per(params[:per_page] || 5)
    
    respond_to do |format|
      format.json { render json: @comments }
      format.js do
        if @comments.any?
          render partial: 'components/comments/list', 
            locals: { commentable: @album, comments: @comments }
        else 
          head :bad_request
        end
      end
    end
  end
end
