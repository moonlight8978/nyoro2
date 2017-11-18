class Ec::ProductsController < ApplicationController
  include Ec::Products::ProductsFilter

  layout 'ec'

  decorates_assigned :product, :products

  def index
    @search = search
    @products = @search.results
    @hits = @search.hits
  end

  def show
    @product = Ec::Product
      .includes(colors: [:storage])
      .find(params[:id])
  end

private

  def additional_params
    { associations: [:discount] }
  end
end
