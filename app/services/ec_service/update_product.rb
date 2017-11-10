class EcService::UpdateProduct
  attr_accessor :product
  
  def initialize(**args)
    @product = args[:product]
    @product_params = args[:product_params]
  end
  
  def perform
    ActiveRecord::Base.transaction do
      product.update(@product_params)
    end
    
    product
  end
end