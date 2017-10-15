module Feature::CommentsHelper
  def comments_for(commentable, initial_comments, *params)
    render partial: 'components/comments/container', 
      locals: { commentable: commentable, initial_comments: initial_comments }
  end
end
