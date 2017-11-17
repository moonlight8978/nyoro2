class Ec::ShopsController < ApplicationController
  layout 'ec'

  decorates_assigned :shop, :shops
  decorates_assigned :products

  def index
    #code
  end

  def show
    @shop = Ec::Shop
      .find(params[:id])
    @search = search
    @products = @search.results
  end

private

  def search
    Ec::Product.search_and_filter(
      q: params[:q],
      types: params[:types],
      min_price: params[:min_price] || 0,
      max_price: params[:max_price],
      category_id: params[:category],
      order_by: params[:sort],
      reverse_sort: params[:reverse_sort],
      associations: [:discount],
      shop_id: @shop.id
    )
  end
end
