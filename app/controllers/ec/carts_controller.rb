class Ec::CartsController < ApplicationController
  layout 'ec'

  before_action :authenticate_user!

  # decorates_assigned :colors

  def show
    @cart_color_ids = session[:cart].keys
    @colors = Ec::Product::Color
      .includes(product: :discount)
      .where(id: @cart_color_ids)
    @total = @colors.reduce(0) { |memo, color| memo + color.price_after_discount }
  end

  def create
    session[:cart] ||= {}
    session[:cart]["#{params[:color_id]}"] ||= 0
    session[:cart]["#{params[:color_id]}"] += 1
    p session[:cart]
    total = session[:cart].values.reduce(0, :+)
    render plain: total, status: :ok
  end

  def destroy
    session[:cart] ||= {}
    key = "#{params[:color_id]}"
    session[:cart].has_key?(key) && session[:cart].delete(key)
    redirect_to ec_cart_path
  end
end
