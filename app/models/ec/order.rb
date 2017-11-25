class Ec::Order < ApplicationRecord
  enum status: %w(waiting accepted shipping completed canceled)
  enum payment_method: %w(on_delivery card)

  # associations
  belongs_to :user,
    class_name: 'User'
  belongs_to :payment,
    class_name: 'Ec::Payment'
  belongs_to :shipping,
    class_name: 'Ec::Order::Shipping'
  has_many :products,
    class_name: 'Ec::Order::Product'
  has_one :invoice, 
    class_name: 'Ec::Invoice::OriginalInvoice'

  # scopes
  
  # class methods

  # validates

  # callbacks
  after_initialize :set_default_values

  def set_default_values
    self.status ||= :waiting
  end

  # instance methods
end
