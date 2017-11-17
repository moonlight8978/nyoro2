class Ec::Product::ColorDecorator < ApplicationDecorator
  delegate_all
  delegate :status, to: :storage

  decorates_association :storage

  def discount_price_meta

  end

  def price_meta(**options)
    options = {
      discount: false,
      strike: false,
      currency: '¥',
      style: :wow
    }.merge(options)

    price = options[:discount] ? object.price_after_discount : object.price
    meta = styling_price(price, options[:currency], options[:style])
    options[:strike] ? h.content_tag(:span, meta, class: 'b-line-through') : meta
  end

private

  def styling_price(price, currency, style)
    case style
    when :wow
      h.content_tag :div, class: 'b-product-price' do
        h.content_tag(:span, currency, class: 'b-price-currency') \
        + h.content_tag(:strong, price, class: 'b-price-cost')
      end
    when :normal
      h.content_tag(:span, "#{currency}#{price}")
    end
  end
end
