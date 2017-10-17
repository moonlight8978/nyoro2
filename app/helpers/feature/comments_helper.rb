module Feature::CommentsHelper
  def comments_for(commentable, *params)
    initial_comments = commentable.comments.includes(:user).page(1).per(5)
    render partial: 'components/comments/container', 
      locals: { commentable: commentable, initial_comments: initial_comments }
  end
end
