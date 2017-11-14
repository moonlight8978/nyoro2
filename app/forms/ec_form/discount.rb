class EcForm::Discount
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :product, :discount

  delegate :shop, :system, to: :discount

  validates :shop,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 0.7,
      message: 'Discount value must be in 0.00 ~ 0.70'
    }

  def discount
    @discount ||= @product.discount
  end

  def save(params)
    discount.assign_attributes(params)

    if valid?
      ActiveRecord::Base.transaction do
        @discount.save
      end
      
      true
    else
      false
    end
  end
end
