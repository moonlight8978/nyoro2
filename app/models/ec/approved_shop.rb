class Ec::ApprovedShop < Ec::Shop
  delegate :avatar, :user_name, to: :user
end
