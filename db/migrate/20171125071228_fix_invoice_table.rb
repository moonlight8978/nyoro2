class FixInvoiceTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :ec_invoice_shop_invoices, :original_invoice

    add_column :ec_invoice_original_invoices, :first_name, :string
    add_column :ec_invoice_original_invoices, :last_name, :string
    add_column :ec_invoice_original_invoices, :address, :string
    add_column :ec_invoice_original_invoices, :phone_number, :string

    create_join_table :original_invoices, :products, {
      id: false, 
      table_name: :ec_invoice_original_invoices_order_products 
    } do |t|

      t.index [:original_invoice_id, :product_id], 
        name: :index_ec_original_invoice_id_product_id
    end

    create_join_table :shop_invoices, :products, {
      id: false, 
      table_name: :ec_invoice_shop_invoices_order_products 
    } do |t|

      t.index [:shop_invoice_id, :product_id], 
        name: :index_ec_shop_invoice_id_product_id
    end
  end
end
