module Db::SearchHelper
  def highlight_result(hit, field)
    if hit.highlights(field).length > 0
      highlighted = hit.highlight(field).format do |fragment| 
        content_tag(:em, fragment, class: 'highlight')
      end
      highlighted.html_safe
    else
      false
    end
  end
end
