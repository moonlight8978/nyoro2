class Ec::CheckoutsController < ApplicationController
  layout 'ec'

  def show
    @order_form = EcForm::Order.new(user: current_user)
  end

  def create
    @order_form = EcForm::Order.new(user: current_user)
  end

  def preview
    @cart_color_ids = session[:cart].keys
    @order_form = EcForm::Order.new(user: current_user)
    @order_form.assign(
      order_params: order_params,
      invoice_params: invoice_params
    )
    @order_form.all_valid? || render(action: :show)
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
