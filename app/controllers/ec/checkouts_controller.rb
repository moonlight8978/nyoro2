class Ec::CheckoutsController < ApplicationController
  layout 'ec'

  def show
    @order_form = EcForm::Order.new(user: current_user)
  end

  def create
    @order_form = EcForm::Order.new(user: current_user)
    @order_form.build(order_params: order_params, invoice_params: invoice_params)
    if @order_form.all_valid?
      ::EcService::PlaceOrder.new(
        order_params: order_params,
        invoice_params: invoice_params,
        user: current_user,
        cart: session[:cart]
      ).perform
      session.delete(:cart)
    end
    redirect_to ec_products_path
  end

  def preview
    @cart_color_ids = session[:cart].keys
    @total = ::EcService::GetCartInfo.new(session[:cart]).perform[:total]
    @order_form = EcForm::Order.new(user: current_user)
    @order_form.build(order_params: order_params, invoice_params: invoice_params)
    render(action: :show) unless @order_form.all_valid?
  end

private

  def order_params
    params.require(:ec_form_order).permit(
      :shipping_id, :payment_method
    )
  end

  def invoice_params
    params.require(:ec_form_order).permit(
      invoice_form: [:first_name, :last_name, :phone_number, :address]
    )[:invoice_form]
  end
end
