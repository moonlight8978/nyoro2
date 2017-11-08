class EcForm::Color
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :product, :color

  delegate :product_id, :name, :price, to: :color

  validates :name,
    presence: true

  def color
    @color ||= product.colors.build
  end

  def assign_new_attributes(new_attributes)
    color.assign_attributes(new_attributes)
  end
end
