class CreateEcInvoiceOriginalInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :ec_invoice_original_invoices do |t|
      t.references :order
      
      t.integer :total
      t.integer :point

      t.timestamps
    end
  end
end
