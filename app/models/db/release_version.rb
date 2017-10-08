class Db::ReleaseVersion < ApplicationRecord
  belongs_to :release, 
    optional: true
  belongs_to :previous_version, 
    class_name: 'Db::Release', optional: true
  
  def cost
    @cost ||= CostValue.new(price, currency)
  end
end
