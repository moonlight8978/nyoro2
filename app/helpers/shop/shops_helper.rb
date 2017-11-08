module Shop::ShopsHelper
  def is_current_user_shop?(shop)
    shop == current_user.shop
  end
end
