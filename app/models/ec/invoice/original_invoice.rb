class Ec::Invoice::OriginalInvoice < Ec::Invoice
  self.table_name = 'ec_invoice_original_invoices'

  has_many :shop_invoices,
    class_name: 'Ec::Invoice::ShopInvoice'
  has_and_belongs_to_many :products,
    class_name: 'Ec::Order::Product',
    join_table: :ec_invoice_original_invoices_order_products
end
