class Ec::CheckoutsController < ApplicationController
  layout 'ec'

  def index
    @order = Ec::Order.new
  end
end
