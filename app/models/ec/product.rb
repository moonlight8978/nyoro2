class Ec::Product < ApplicationRecord
  MAX_PRICE = 1_000_000
  MIN_PRICE = 0
  # associations
  belongs_to :shop,
    class_name: :'Ec::ApprovedShop'
  has_one :discount,
    class_name: :'Ec::Product::Discount'
  has_many :colors,
    class_name: :'Ec::Product::Color'
  has_many :images,
    class_name: :'Ec::Product::Image'
  belongs_to :category,
    class_name: :'Ec::Category'

  # scopes
  # class methods
  # validates
  # callbacks
  # instance methods
end
