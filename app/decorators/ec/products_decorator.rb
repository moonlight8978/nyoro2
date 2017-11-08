class Ec::ProductDecorator < ApplicationDecorator
  delegate_all

  decorates_association :colors

  def asd
    :asd
  end
end
