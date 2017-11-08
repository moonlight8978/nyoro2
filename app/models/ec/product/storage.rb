class Ec::Product::Storage < ApplicationRecord
  # associations
  belongs_to :color,
    class_name: 'Ec::Product::Color'

  # scopes

  # class methods

  # validates

  # callbacks

  # instance methods
  def quantity
    total - sold
  end
end
