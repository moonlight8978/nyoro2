class Ec::Product::Color < ApplicationRecord
  # TODO reindex background job
  delegate :quantity, to: :storage

  before_destroy :product_has_at_least_one_color
  after_save :reindex_product
  after_destroy :reindex_product
  # associations
  belongs_to :product,
    class_name: :'Ec::Product'
  has_one :storage,
    class_name: 'Ec::Product::Storage'

  # scopes

  # class methods

  # validates

  # callbacks
  def reindex_product
    Sunspot.index self.product
  end

  def product_has_at_least_one_color
    throw(:abort) unless self.product.colors.size > 1
  end

  # instance methods
  def price_after_discount
    (price * (1 - product.discount.total)).round
  end
end
