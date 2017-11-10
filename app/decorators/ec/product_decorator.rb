class Ec::ProductDecorator < ApplicationDecorator
  delegate_all

  decorates_association :colors,
    with: Ec::Product::ColorsDecorator

  def price_range
    if object.min_price == object.max_price
      "¥#{object.max_price}"
    else
      "¥#{object.min_price} - ¥#{object.max_price}"
    end
  end

  def asd
    :asd
  end
end
