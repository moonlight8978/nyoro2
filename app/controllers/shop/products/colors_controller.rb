class Shop::Products::ColorsController < ApplicationController
  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!

  respond_to :js

  def create
    @product = @shop.products.find(params[:product_id])
    @color_form = EcForm::Color.new(product: @product)
    if @color_form.create(color: color_params, storage: storage_params)
      head :ok
    else
      render(
        plain: RenderErrorService.perform(
          color: @color_form.errors.messages,
          storage: @color_form.storage_form.errors.messages
        ),
        status: :bad_request
      )
    end
  end

  def update
    @product = @shop.products.find(params[:product_id])
    @color = @product.colors.find(params[:id])

    @color_form = EcForm::Color.new(color: @color)
    if @color_form.update(color: color_params, storage: storage_params)
      head :ok
    else
      render(
        plain: RenderErrorService.perform(
          color: @color_form.errors.messages,
          storage: @color_form.storage_form.errors.messages
        ),
        status: :bad_request
      )
    end
  end

  def destroy_multiple
    #code
  end

private

  def color_params
    params.require(:ec_form_color).permit(
      :name, :price
    )
  end

  def storage_params
    params.require(:ec_form_color).permit(
      storage_form: [:quantity]
    )[:storage_form]
  end
end
