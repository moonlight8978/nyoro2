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
      style: :wow,
      size: 150,
      class_names: nil
    }.merge(options)

    price = options[:discount] ? object.price_after_discount : object.price
    price = h.number_with_delimiter(price, delimiter: ",")
    meta = styling_price(price, options[:currency], options[:style], options[:class_names])
    options[:strike] ? h.content_tag(:span, meta, class: 'b-line-through') : meta
  end

private

  def styling_price(price, currency, style, class_names)
    case style
    when :wow
      h.content_tag :div, class: "b-product-price #{class_names}" do
        h.content_tag(:span, currency, class: 'b-price-currency') \
        + h.content_tag(:strong, price, class: 'b-price-cost')
      end
    when :normal
      h.content_tag(:span, "#{currency}#{price}", class: class_names)
    end
  end
end
