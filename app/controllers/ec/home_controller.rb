class Ec::HomeController < ApplicationController
  layout 'ec'

  decorates_assigned :products

  def index
    size = Ec::Product.count

    @products = Ec::Product.includes(:discount).all.limit(3)

    @categories = Ec::Category.selectable
  end
end
