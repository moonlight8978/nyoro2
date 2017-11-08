class Ec::ShopDecorator < ApplicationDecorator
  delegate_all

  decorates_association :user

  def status_tag
    if object.approved?
      h.content_tag :label, 'approved', class: 'b-label create'
    else
      h.content_tag :label, 'unapproved', class: 'b-label destroy'
    end
  end
end
