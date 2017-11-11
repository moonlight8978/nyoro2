class EcService::CreateColor
  # TODO refactor
  attr_accessor :product

  # accept: :product, :color_params, :storage_params
  def initialize(**args)
    @product = args[:product]
    @color_params = args[:color_params]
    @storage_params = transform_storage_params(args[:storage_params])
  end

  def perform
    ActiveRecord::Base.transaction do
      color = product.colors.create(@color_params)
      color.create_storage(@storage_params)
    end
  end

private

  def transform_storage_params(params)
    ActionController::Parameters
      .new(total: params[:quantity])
      .permit(:total)
  end
end
