class Ec::Product::Discount < ApplicationRecord
  belongs_to :product,
    class_name: :'Ec::Product'

  def total
    self[:system] + self[:shop]
  end
end
