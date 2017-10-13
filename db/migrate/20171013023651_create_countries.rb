class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :name_en
      t.string :name_pronounce, index: true
      
      t.string :code, index: true
      t.text :note
      
      t.timestamps
    end
  end
end
