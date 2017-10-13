class Db::Release < ApplicationRecord
  belongs_to :album_version, 
    optional: true
  belongs_to :publisher, 
    optional: true, class_name: 'Db::Company'
    
  def cost
    @cost ||= CostValue.new(price, currency)
  end
end
