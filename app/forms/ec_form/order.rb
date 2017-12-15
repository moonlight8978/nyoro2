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
  # @option args [Parameters] :order_params order params
  # @option args [Parameters] :invoice_params invoice params
  def assign(**args)
    @order_params = args[:order_params]
    @invoice_params = args[:invoice_params]
    order.assign_attributes(@order_params)
    invoice_form.build(@invoice_params)
    p @invoice_params
  end

  alias_method :build, :assign
end
