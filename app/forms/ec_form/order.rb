class EcForm::Order
  include ActiveModel::Dirty
  include ActiveModel::Model

  # Pass [User] if a new order will be created,
  #   for updating, pass [Ec::Order]
  attr_accessor :order, :user

  # return [EcForm::Invoice] nested form for invoice basic informations
  attr_accessor :invoice_form

  delegate :shipping_id, :shipping, :payment_id, :payment_method, :status, to: :order

  validates :shipping,
    presence: true
  validates :payment_method,
    presence: true

  def order
    @order ||= Ec::Order.new(user: user)
  end

  def invoice_form
    @invoice_form ||= EcForm::Invoice.new(order: order)
  end

  # @return [true, false] true if both order and invoice form are valid
  def all_valid?
    valid?
    invoice_form.valid?
    
    valid? && invoice_form.valid?
  end

  # @param args [Hash] not optional arguments
  # @option args [Parameters] :order_params
  # @option args [Parameters] :invoice_params
  #
  # @return [true, false]
  def save(**args)
    if all_valid?
      
    else
      
    end
  end

  # @param (see #save)
  def assign(**args)
    order.assign_attributes(args[:order_params])
    invoice_form.assign(args[:invoice_params])
  end
end
