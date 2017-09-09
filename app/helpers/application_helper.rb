module ApplicationHelper
  def page_title(big_title, small_title)
    render partial: 'components/title', 
      locals: { big_title: big_title, small_title: small_title }
  end
  
  # link_array: [{ path: , name: }]
  # last: name
  def breadcrumb(*link_array, last)
    links = link_array.map do |link|
      "<li class='breadcrumb-item'><a href='#{link[:path]}'>#{link[:name]}</a></li>"
    end << "<li class='breadcrumb-item active'><span>#{last}</span></li>"
    _breadcrumb = 
      '<div class="container"><ol class="breadcrumb">' << 
      links.join('') << 
      '</ol></div>'
    content_for(:breadcrumb, _breadcrumb.html_safe)
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
end
