module Ec::Shop::CheckStatus

private

  def shop_must_be_approved!
    @shop.approved? || (redirect_to shop_path and return)
  end
end
