class Ec::Product < ApplicationRecord
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
  # def self.table_name_prefix
  #   'ec_product_'
  # end


end
