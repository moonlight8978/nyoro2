class Ec::Invoice::ShopInvoice < Ec::Invoice
  self.table_name = 'ec_invoice_shop_invoices'

  delegate :order, to: :original_invoice

  belongs_to :shop,
    class_name: 'Ec::Shop'
  belongs_to :original_invoice,
    class_name: 'Ec::Invoice::OriginalInvoice'
  has_and_belongs_to_many :products,
    class_name: 'Ec::Order::Product',
    join_table: :ec_invoice_shop_invoices_order_products
end
