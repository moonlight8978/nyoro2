class EcForm::Product
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :shop, :product, :total, :color, :storage

  delegate :name, :category_id, :category, :description, :colors, to: :product

  validates :name,
    presence: { message: '製品の名が入力されていません。' }
  validates :shop,
    presence: { message: '店が存在ではありません。' }

  def product
    @product ||= shop.products.new
  end

  def color
    @color ||= EcForm::Color.new(product: product)
  end

  def storage
    @storage ||= EcForm::Storage.new(color: color.color)
  end

  def valid?
    invalid = errors.any? || color.valid? || storage.valid?
    !invalid
  end

  def check
    p color
    p storage
  end

  def save(**args)
    product.assign_attributes(args[:product])
    color.assign_new_attributes(args[:color])
    storage.assign_new_attributes(args[:storage])

    if valid?
      p "OK"
      true
    else
      p "tach"
      p product.errors, color.errors, storage.errors
      false
    end
  end
end
