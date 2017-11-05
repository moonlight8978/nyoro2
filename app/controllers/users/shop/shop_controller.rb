class Users::Shop::ShopController < ApplicationController
  layout 'shop'

  before_action :authenticate_user!
  before_action :has_shop?

  def show
    @shop || (redirect_to action: :new and return)
  end


  def new
    @shop && (redirect_to action: :show and return)
    @form = EcForm::Shop.new
  end

  def create
    @form = EcForm::Shop.new(user: current_user)

    if @form.save(shop_params)
      redirect_to shop_path
    else
      render :new
    end
  end

  def edit
    #code
  end

  def update
    @form = EcForm::Shop.new(user: current_user, shop: @shop)

    if @form.save(shop_params)
      redirect_to shop_path
    else
      render :edit
    end
  end

private

  def has_shop?
    @shop = Ec::Shop.find_by(user: current_user)
  end

  def shop_params
    params.require(:ec_form_shop).permit(
      :name, :address, :website, :description, :email, :phone
    )
  end
end
