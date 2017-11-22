class Ec::CartsController < ApplicationController
  layout 'ec'

  before_action :authenticate_user!

  decorates_assigned :products

  def show
    @products = Ec::Product
      .where(id: session[:cart].keys)
  end

  def create
    session[:cart] ||= {}
    session[:cart]["#{params[:product_id]}"] ||= 0
    session[:cart]["#{params[:product_id]}"] += 1
    p session[:cart]
    total = session[:cart].values.reduce(0, :+)
    render plain: total, status: :ok
  end

  def destroy
    
  end
end
