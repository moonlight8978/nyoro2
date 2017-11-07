class Ec::Product::Image < ApplicationRecord
  mount_uploader :image, ProductImageUploader
   
  belongs_to :product,
    class_name: :'Ec::Product'
end
