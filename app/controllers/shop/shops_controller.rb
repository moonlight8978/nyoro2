class Shop::ShopsController < ApplicationController
  layout 'ec'

  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!
  before_action :no_shop_only!, only: [:new, :create]
  before_action :must_have_shop!, only: [:show, :edit, :update]
  before_action :shop_must_be_approved!, only: [:edit, :update]

  def show
    @shop || (redirect_to action: :new and return)
  end

  def new
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
    @form = EcForm::Shop.new(user: current_user, shop: @shop)
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

  def shop_params
    params.require(:ec_form_shop).permit(
      :name, :address, :website, :description, :email, :phone
    )
  end
end
