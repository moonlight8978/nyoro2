class Users::ShopController < ApplicationController
  layout 'shop'

  before_action :authenticate_user!
  before_action :has_shop?

  def show
    @shop || (redirect_to action: :new and return)
  end

  def new
    @shop && (redirect_to action: :show and return)
    @shop = current_user.build_shop
  end

  def create
    #code
  end

private

  def has_shop?
    @shop = Ec::Shop.find_by(user: current_user)
  end
end
