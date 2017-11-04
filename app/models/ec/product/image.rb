class Ec::Product::Image < ApplicationRecord
  belongs_to :product,
    class_name: :'Ec::Product'
end
