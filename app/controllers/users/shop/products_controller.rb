class Users::Shop::ProductsController < ApplicationController
  layout 'shop'

  before_action :authenticate_user!
  before_action :find_shop

  def index

  end

  def show
    @product = @shop.products.find(params[:id])
  end

  def destroy_multiple
    #code
  end

private

  def find_shop
    @shop = current_user.approved_shop
  end
end
