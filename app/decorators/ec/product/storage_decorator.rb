class Ec::Product::StorageDecorator < ApplicationDecorator
  delegate_all

  def status
    object.quantity > 0 ? quantity_in_words(object.quantity) : '完売'
  end

  def status_icon
    object.quantity > 0 ?
      h.content_tag(:i, nil, class: "fa fa-check-circle b-color-green") :
      h.content_tag(:i, nil, class: "fa fa-times-circle b-color-red")
  end

private

  def quantity_in_words(quantity)
    h.content_tag :div do
      '残り'.html_safe + h.content_tag(:strong, quantity)
    end
  end
end
