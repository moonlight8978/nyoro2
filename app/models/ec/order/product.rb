class Ec::Order::Product < ApplicationRecord
  # associations
  belongs_to :product,
    class_name: "Ec::Product"
  # scopes
  # class methods
  # validates
  # callbacks
  # instance methods
end
