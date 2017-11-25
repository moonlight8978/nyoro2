class EcForm::Invoice
  include ActiveModel::Dirty
  include ActiveModel::Model
  
  # An order is required to create a new invoice
  attr_accessor :order

  delegate :point, :last_name, :address, :first_name, :phone_number, to: :invoice

  validates :last_name,
    presence: true
  validates :first_name,
    presence: true
  validates :phone_number,
    presence: true
  validates :address,
    presence: true

  def invoice
    @invoice ||= order.build_invoice
  end

  def save
    if valid?
      
    else
      
    end
  end

  def assign(params)
    invoice.assign_attributes(params)
    p invoice
  end
end
