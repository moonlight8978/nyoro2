class Ec::Product::Discount < ApplicationRecord
  belongs_to :product,
    class_name: :'Ec::Product'
end
