class CreateEcInvoiceShopInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :ec_invoice_shop_invoices do |t|
      t.references :shop
      t.references :order
      
      t.integer :total
      t.integer :point

      t.timestamps
    end

    add_column :ec_orders, :payment_method, :integer
  end
end
