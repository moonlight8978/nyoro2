class Ec::Product::DiscountDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end


  def total_percents
    # object.total > 0 ? "-#{object.total * 100}%" : nil
    "-#{(object.total * 100).to_i}%"
  end
end
