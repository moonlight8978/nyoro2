class EcForm::Shop
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :user, :shop
  delegate :name, :address, :phone, :email, :website, :description, to: :shop

  validates :name,
    presence: { message: '店名が入力されていません。' }
  validates :user,
    presence: { message: '店のオーナーが存在ではありません。' }

  def shop
    @shop ||= Ec::UnapprovedShop.new(user: user)
  end

  def save(params)
    shop.assign_attributes(params)

    if valid?
      ActiveRecord::Base.transaction do
        shop.save
      end
    end
  end
end
