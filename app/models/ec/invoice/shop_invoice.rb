class Ec::Invoice::ShopInvoice < Ec::Invoice
  self.table_name = 'ec_invoice_shop_invoices'

  belongs_to :shop,
    class_name: 'Ec::Shop'
  belongs_to :original_invoice,
    class_name: 'Ec::Invoice::OriginalInvoice'
end
