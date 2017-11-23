class CreateSecondSprintTables < ActiveRecord::Migration[5.1]
  def change
    create_table :ec_orders do |t|
      t.belongs_to :shipping
      t.belongs_to :payment
      t.belongs_to :user

      t.integer :status

      t.timestamps
    end

    create_table :ec_payments do |t|
      t.string :type, index: true
      t.belongs_to :user

      t.string :card_number, index: true
      t.date :expiration_date
      t.boolean :completed

      t.timestamps
    end

    create_table :ec_order_shippings do |t|
      t.string :method
      t.integer :price
      t.text :description

      t.timestamps
    end

    create_table :ec_order_products do |t|
      t.belongs_to :product

      t.integer :price
      t.string :color
      t.float :shop_discount
      t.float :system_discount
      t.integer :quantity

      t.timestamps
    end

    # create_table :ec_original_invoices do |t|
    #   t.belongs_to :user
    #   t.belongs_to :order
    #
    #   t.integer :total
    #   t.integer :points_used, default: 0
    #
    #   t.timestamps
    # end
    #
    # create_table :ec_shop_invoices do |t|
    #   t.belongs_to :shop
    #   t.belongs_to :original_invoice
    #
    #   t.timestamps
    # end
    #
    # create_join_table :ec_original_invoices, :ec_order_products,
    #   table_name: :ec_original_invoices_order_products, id: false do |t|
    #
    #   t.index [:original_invoice_id, :product_id], name: :index_ec_original_invoices_products
    # end
    #
    # create_join_table :ec_shop_invoices, :ec_order_products,
    #   table_name: :ec_order_products_shop_invoices, id: false do |t|
    #
    #   t.index [:shop_invoice_id, :product_id], name: :index_ec_shop_invoices_products
    # end
  end
end
