class Shop::ProductsController < ApplicationController
  layout 'shop'

  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!

  def index
    @products = @shop.products
  end

  def show
    @product = @shop.products.find(params[:id])
  end

  def create

  end

  def destroy_multiple
    #code
  end

private
end
