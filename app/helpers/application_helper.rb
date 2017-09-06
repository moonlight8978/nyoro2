module ApplicationHelper
  def page_title(big_title, small_title)
    render partial: 'components/title', 
      locals: { big_title: big_title, small_title: small_title }
  end
  
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
end
