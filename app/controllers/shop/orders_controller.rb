class Shop::OrdersController < ApplicationController
  layout 'ec'
  
  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!

  def index
    @invoices = @shop.invoices
  end
end
