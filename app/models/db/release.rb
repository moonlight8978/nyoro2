class Db::Release < ApplicationRecord
  belongs_to :album_version, optional: true
  
  def cost
    @cost ||= CostValue.new(price, currency)
  end
end
