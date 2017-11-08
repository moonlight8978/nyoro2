class Ec::ProductDecorator < ApplicationDecorator
  delegate_all

  decorates_association :colors,
    with: Ec::Product::ColorsDecorator

  def asd
    :asd
  end
end
