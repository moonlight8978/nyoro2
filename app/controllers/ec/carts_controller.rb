class Ec::CartsController < ApplicationController
  layout 'ec'

  before_action :authenticate_user!

  # decorates_assigned :colors

  def show
    @colors = Ec::Product::Color
      .includes(product: :discount)
      .where(id: session[:cart].keys)
    @colors_grouped = @colors.group_by(&:product_id)
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

  end
end
