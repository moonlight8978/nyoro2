class Ec::Order < ApplicationRecord
  # associations
  belongs_to :user,
    class_name: 'User'
  belongs_to :payment,
    class_name: 'Ec::Payment'
  belongs_to :shipping,
    class_name: 'Ec::Order::Shipping'
  has_many :products,
    class_name: 'Ec::Order::Product'

  # scopes
  # class methods
  # validates
  # callbacks
  # instance methods
end
