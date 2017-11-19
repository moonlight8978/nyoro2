class Ec::ProductsController < ApplicationController
  include Ec::Products::ProductsFilter

  layout 'ec'

  before_action :sidebar

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

  def sidebar
    @tops = Ec::Product
      .includes(:discount)
      .all
      .limit(5)
    @histories = Ec::Product
      .includes(:discount)
      .all
      .limit(5)
  end
end
