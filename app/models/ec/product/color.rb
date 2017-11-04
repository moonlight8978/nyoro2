class Ec::Product::Color < ApplicationRecord
  belongs_to :product,
    class_name: :'Ec::Product'
end
