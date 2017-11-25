class Ec::Invoice::OriginalInvoice < Ec::Invoice
  self.table_name = 'ec_invoice_original_invoices'
  
  has_many :shop_invoices,
    class_name: 'Ec::Invoice::ShopInvoice'
end
