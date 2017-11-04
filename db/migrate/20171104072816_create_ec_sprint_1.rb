class CreateEcSprint1 < ActiveRecord::Migration[5.1]
  def change
    create_table :ec_shops do |t|
      t.references :user, index: true
      t.string :type, index: true

      t.string :name
      t.string :website
      t.string :phone
      t.string :email
      t.string :address
      t.text :description

      t.timestamps
    end

    create_table :ec_products do |t|
      t.references :category, index: true

      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :ec_product_colors do |t|
      t.references :product, index: true

      t.string :name
      t.string :price

      t.timestamps
    end

    create_table :ec_product_images do |t|
      t.references :product, index: true

      t.string :image
      t.boolean :nsfw, default: false

      t.timestamps
    end

    create_table :ec_product_discounts do |t|
      t.references :product, index: true

      t.float :shop, default: 0
      t.float :system, default: 0

      t.timestamps
    end

    create_table :ec_categories do |t|
      t.references :parent, null: true, index: true

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
