class AddCommentsCountToEcProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :ec_products, :comments_count, :integer, default: 0
  end
end
