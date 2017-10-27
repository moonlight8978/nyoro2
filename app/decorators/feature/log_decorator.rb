class Feature::LogDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def action_icon
    icon =
    case object.action
    when 'update'
      'pencil'
    when 'create'
      'plus'
    when 'destroy'
      'trash'
    when 'comment'
      'commenting'
    end
    icon_for(object.action, icon)
  end

  def commented_at
    object.created_at.strftime('%Y年%-m月%-d日 - %H:%I')
  end

  def description
    object.description.present? ? object.description : 'ありません'
  end

private

  def icon_for(action, icon)
    h.content_tag :i, nil, class: "fa fa-#{icon} pr-1"
  end
end
