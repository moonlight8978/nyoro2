module Ec::Shop::CheckExistence

private

  def must_have_shop!
    find_shop
    @shop || (redirect_to new_shop_path and return)
  end

  def no_shop_only!
    find_shop
    @shop && (redirect_to shop_path and return)
  end

  def find_shop
    @shop = Ec::Shop.find_by(user: current_user)
  end
end
