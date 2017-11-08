class Ec::Product::StorageDecorator < ApplicationDecorator
  delegate_all

  def status
    object.quantity > 0 ? quantity_in_words(object.quantity) : '完売'
  end

private

  def quantity_in_words(quantity)
    h.content_tag :div do
      '残り'.html_safe + h.content_tag(:strong, quantity)
    end
  end
end
