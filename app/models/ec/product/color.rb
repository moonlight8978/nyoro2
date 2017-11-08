class Ec::Product::Color < ApplicationRecord
  delegate :quantity, to: :storage

  # associations
  belongs_to :product,
    class_name: :'Ec::Product'
  has_one :storage,
    class_name: 'Ec::Product::Storage'

  # scopes

  # class methods

  # validates

  # callbacks

  # instance methods
  def price_after_discount
    price - price * product.discount.total
  end
end
