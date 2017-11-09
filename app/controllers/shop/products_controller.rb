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
    @form.check
  end

  def create
    @form = EcForm::Product.new(shop: @shop)
    if @form.save(product: product_params, color: color_params, storage: storage_params)
      redirect_to shop_product_path(@form.product)
    else
      render action: :new
    end
  end

  def edit
    @product = @shop.products.find(params[:id])
    @form = EcForm::Product.new(shop: @shop, product: @product)
  end

  def destroy_multiple
    @products = @shop.products.where(id: params[:shop_product_ids])
    @products.destroy_all
    redirect_back fallback_location: shop_products_path
  end

private

  def product_params
    params.require(:ec_form_product).permit(
      :name, :category_id, :description
    )
  end

  def color_params
    params.require(:ec_form_product).permit(
      color_form: [:name, :price]
    )[:color_form]
  end

  def storage_params
    params.require(:ec_form_product).permit(
      storage_form: [:total]
    )[:storage_form]
  end
end
