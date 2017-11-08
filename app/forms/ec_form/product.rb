class EcForm::Product
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :shop, :product

  delegate :name, :category_id, :category, :description, :colors, :colors_attributes=, to: :product

  validates :name,
    presence: { message: '製品の名が入力されていません。' }
  validates :shop,
    presence: { message: '店が存在ではありません。' }

  def product
    @product ||= shop.products.new
  end

  def save(params)
    product.assign_attributes(params)

    if valid?
      p "OK"
      true
    else
      p "tach"
      false
    end
  end

  # def colors_attributes=(attributes)
  #   attributes.each do |i, color_params|
  #     @product.colors.push(@product.colors.build(color_params))
  #   end
  # end
end
