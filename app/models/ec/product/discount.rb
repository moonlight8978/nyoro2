class Ec::Product::Discount < ApplicationRecord
  after_initialize :set_default_values
  before_save :round_numbers
  # associations
  belongs_to :product,
    class_name: :'Ec::Product'

  validates :system,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 0.7
    }

  # scopes
  # class methods
  # validates
  # callbacks
  def set_default_values
    self.system = 0
    self.shop = 0
  end

  def round_numbers
    self.system.round(1)
    self.shop.round(1)
  end

  # instance methods
  def total
    self[:system] + self[:shop]
  end
end
