class Shop::Products::DiscountsController < ApplicationController
  include Ec::Shop::CheckStatus
  include Ec::Shop::CheckExistence

  before_action :authenticate_user!, :must_have_shop!, :shop_must_be_approved!
end
