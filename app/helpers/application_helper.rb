module ApplicationHelper
  def page_title(big_title, small_title)
    render partial: 'components/title', 
      locals: { big_title: big_title, small_title: small_title }
  end
  
  # link_array: [{ path: , name: }]
  # last: name
  def breadcrumb(*link_array, last)
    render partial: 'components/breadcrumb', locals: {
      link_array: link_array, last: last
    }
  end
  
  def comments_for(commentable, initial_comments, *params)
    render partial: 'components/comments/container', 
      locals: { commentable: commentable, initial_comments: initial_comments }
  end
  
  def j_full_date(full_date)
    full_date.strftime('%Y年%m月%d日 - %H:%M:%S')
  end
  
  def nsfw_status
    session[:nsfw]
  end
  
  def img_thumb(img, ratio, avatar = false)
    render partial: 'components/img_thumb', locals: { 
      img: img, ratio: ratio, avatar: avatar 
    }
  end
  
  def current_user_avatar
    if user_signed_in?
      img_thumb(current_user.avatar_url || '/assets/unknown-user.png', '1_1', true)
    else
      img_thumb('/assets/unknown-user.png', '1_1', true)
    end
  end
  
  def can_edit_comment(comment)
    user_signed_in? && comment.can_be_edited_by(current_user)
  end
end
