class Ec::Product::Storage < ApplicationRecord
  after_initialize :set_default_values

  attr_accessor :quantity
  
  # associations
  belongs_to :color,
    class_name: 'Ec::Product::Color'

  # scopes

  # class methods

  # validates

  # callbacks
  def set_default_values
    self.sold ||= 0
    self.total ||= 0
  end

  # instance methods
  def quantity
    @quantity ||= total - sold
  end
end
