class EcForm::Product
  # FIXME storage will receive :quantity instead of :total / :sold
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :shop, :product, :total, :color_form, :storage_form

  delegate :name, :category_id, :category, :description, :colors, to: :product

  validates :name,
    presence: { message: '製品の名が入力されていません。' }
  validates :shop,
    presence: { message: '店が存在ではありません。' }
  validates :category_id,
    presence: { message: 'category_id is blank' }
  validates :category,
    presence: { message: 'category does not exist' }

  def product
    @product ||= shop.products.new
  end

  def color_form
    @color ||= EcForm::Color.new(color: product.colors.build)
  end

  def storage_form
    @storage ||= EcForm::Storage.new(storage: color_form.color.build_storage)
  end

  def valid?(action:)
    product_valid = super
    case action
    when :create
      default_color_valid = color_form.valid?
      storage_valid = storage_form.valid?
      product_valid && default_color_valid && storage_valid
    when :update
      product_valid
    end
  end

  def check
    p color_form, storage_form
  end

  def create(**args)
    product.assign_attributes(args[:product])
    color_form.color.assign_attributes(args[:color])
    storage_form.storage.assign_attributes(args[:storage])

    valid?(action: :create) && create_product(**args)
  end

  def update(**args)
    product.assign_attributes(args[:product])

    valid?(action: :update) && update_product(**args)
  end

private

  def create_product(**args)
    self.product = EcService::CreateProduct
      .new(
        product_params: args[:product],
        default_color_params: args[:color],
        default_color_storage_params: args[:storage],
        shop: shop
      )
      .perform

    product
  end

  def update_product(**args)
    self.product = EcService::UpdateProduct
      .new(
        product_params: args[:product],
        product: product
      )
      .perform

    product
  end
end
