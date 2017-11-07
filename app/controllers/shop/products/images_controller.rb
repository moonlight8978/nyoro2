class Shop::Products::ImagesController < ApplicationController
  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!

  respond_to :js, only: :create

  def create
    @product = @shop.products.find(params[:product_id])
    @image = @product.images.create(image_params)

    unless @image.errors.any?
      head :ok
    else
      p @image.errors
      render plain: render_errors(@image.errors.messages), status: :bad_request
    end
  end

  def destroy_multiple
    @product = @shop.products.find(params[:product_id])
    @images = @product.images.where(id: params[:slide_ids])
    @images.destroy_all
    redirect_back fallback_location: shop_product_path(@product)
  end

private

  def image_params
    params.require(:ec_product_image).permit(:image)
  end

  def render_errors(errors)
    render_to_string partial: 'components/form/errors', locals: { errors: errors }
  end
end
