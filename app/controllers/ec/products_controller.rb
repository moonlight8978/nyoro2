class Ec::ProductsController < ApplicationController
  layout 'ec'

  decorates_assigned :product, :products

  def index
    @search = search
    @products = @search.results
    @hits = @search.hits
  end

  def show
    @product = Ec::Product
      .find(params[:id])
  end

private

  def search
    Ec::Product.search_and_filter(
      q: params[:q],
      types: params[:types],
      min_price: params[:min_price] || 0,
      max_price: params[:max_price],
      category_id: params[:category],
      sort_by: params[:sort],
      reverse_sort: params[:reverse_sort],
      associations: [:discount]
    )
  end
end
