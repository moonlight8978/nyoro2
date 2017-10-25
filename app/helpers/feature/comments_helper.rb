module Feature::CommentsHelper
  def comments_for(commentable, *params)
    initial_comments = commentable.comments.includes(:user).page(1).per(5)
    render partial: 'components/comments/container',
      locals: { commentable: commentable, initial_comments: initial_comments }
  end

  def can_edit_comment(comment)
    user_signed_in? && (comment.can_be_edited_by(current_user) || current_user.is_moderator?)
  end
end
