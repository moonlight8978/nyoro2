class Ec::ShopsController < ApplicationController
  include Ec::Products::ProductsFilter

  layout 'ec'

  decorates_assigned :shop, :shops
  decorates_assigned :products

  def index
    @shops = Ec::ApprovedShop
      .all
      .page(params[:page] || 1)
      .per(20)
  end

  def show
    @shop = Ec::ApprovedShop
      .find(params[:id])
    # @shop.user == current_user && (redirect_to shop_path and return)

    @search = search
    @products = @search.results
    @hits = @search.hits
  end

private

  def additional_params
    {
      associations: [:discount],
      shop_id: @shop.id
    }
  end
end
