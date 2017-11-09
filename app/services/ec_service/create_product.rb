class EcService::CreateProduct
  # accept: :shop, :product_params, :default_color_storage_params, :default_color_params
  attr_accessor :product, :color, :storage, :shop

  def initialize(**args)
    @shop = args[:shop]
    @product_params = args[:product_params]
    @default_color_params = args[:default_color_params]
    @default_color_storage_params = args[:default_color_storage_params]
  end

  def perform
    ActiveRecord::Base.transaction do
      self.product = shop.products.create(@product_params)
      color = product.colors.create(@default_color_params)
      color.create_storage(@default_color_storage_params)
      product.create_discount
    end

    product
  end
end
