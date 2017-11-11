class EcService::UpdateColor
  # TODO refactor
  attr_accessor :product

  # accept: :product, :color_params, :storage_params
  def initialize(**args)
    @color = args[:color]
    @color_params = args[:color_params]
    @storage_params = transform_storage_params(args[:storage_params])
  end

  def perform
    ActiveRecord::Base.transaction do
      @color.update(@color_params)
      @color.storage.update(@storage_params)
    end
  end

private

  def transform_storage_params(params)
    ActionController::Parameters
      .new(total: params[:quantity])
      .permit(:total)
  end
end
