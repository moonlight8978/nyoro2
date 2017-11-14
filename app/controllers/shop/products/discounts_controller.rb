class Shop::Products::DiscountsController < ApplicationController
  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!

  respond_to :js

  def update
    @product = @shop.products.find(params[:product_id])
    @form = EcForm::Discount.new(discount: @product.discount)

    if (@form.save(discount_params))
      head :ok
    else
      render(
        plain: RenderErrorService.perform(discount: @form.errors.messages),
        status: :bad_request
      )
    end
  end

private

  def discount_params
    params.require(:ec_form_discount).permit(:shop)
  end
end
