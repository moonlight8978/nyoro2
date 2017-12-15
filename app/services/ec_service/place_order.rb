class EcService::PlaceOrder
  def initialize(**args)
    @user = args[:user]
    @invoice_params = args[:invoice_params]
    @order_params = args[:order_params]
    @cart = GetCartInfo.new(args[:cart]).perform
  end

  def perform
    ActiveRecord::Base.transaction do
      create_order
      create_ordered_products
      create_original_invoice
      create_shop_invoices
    end
  end

private

  def create_order
    @order = Ec::Order.new(@order_params)
    @order.user = @user
    @order.save
  end

  def create_ordered_products
    @ordered_products = CreateOrderedProducts.new(@cart[:items]).perform
  end

  def create_original_invoice
    @invoice = @order.build_invoice(@invoice_params)
    @invoice.assign_attributes(total: @cart[:total])
    @invoice.products = @ordered_products
    @invoice.save
  end

  def create_shop_invoices
    CreateShopInvoices.new(
      order: @order,
      cart_items: @cart[:items],
      original_invoice: @invoice,
      ordered_products: @ordered_products
    ).perform
  end
end
