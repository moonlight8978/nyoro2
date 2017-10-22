class Feature::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: [:index, :create]
  before_action :comment_must_belongs_to_user, only: [:update, :destroy]

  def index
    @comments = @commentable.comments.includes(:user)
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
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.save && @comment.log_comment(current_user, @commentable.title, params[:description])
    redirect_to @commentable
  end

  def update
    @comment.update(body: params[:body])
    head :ok
  end

  def destroy
    @comment.destroy
    head :ok
  end

private

  def comment_params
    params.require(:feature_comment).permit(:body)
  end

  def find_commentable
    @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
  end

  def comment_must_belongs_to_user
    @comment = current_user.comments.find(params[:id])
  end
end
