class Shop::ProductsController < ApplicationController
  layout 'shop'

  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!
  decorates_assigned :product

  def index
    @products = @shop.products
  end

  def show
    @product = @shop.products.find(params[:id])
  end

  def new
    @form = EcForm::Product.new(shop: @shop)
    3.times { |_| @form.colors.build }
  end

  def create
    @form = EcForm::Product.new(shop: @shop)
    @form.save(product_params)
    p @form.product
    p @form.product.colors 
  end

  def destroy_multiple
    #code
  end

private

  def product_params
    params.require(:ec_form_product).permit(
      :name, :category_id, :description,
      colors_attributes: [:name, :price]
    )
  end
end
