class Ec::Product::ColorDecorator < ApplicationDecorator
  delegate_all
  delegate :status, to: :storage

  decorates_association :storage

  def price
    h.content_tag :div, class: 'b-product-price' do
      h.content_tag(:span, '¥', class: 'b-price-currency') \
      + h.content_tag(:strong, object.price, class: 'b-price-cost')
    end
  end
end
