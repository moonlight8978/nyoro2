class AddShopToEcProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :ec_products, :shop, index: true
  end
end
