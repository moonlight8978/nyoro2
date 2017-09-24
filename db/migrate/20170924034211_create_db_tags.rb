class CreateDbTags < ActiveRecord::Migration[5.1]
  def change
    create_table :db_tags do |t|
      t.string :name
      t.string :name_en
      t.string :name_pronounce, index: true
      t.text :description
      
      t.timestamps
    end
  end
end
