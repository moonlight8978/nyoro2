class Db::Release < ApplicationRecord
  has_many :album_version
  belongs_to :publisher,
    optional: true, class_name: 'Db::Company'

  def cost
    @cost ||= CostValue.new(price, currency)
  end
end
