class CreateDbDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_discs do |t|
      t.boolean :marked, index: true, default: false
      t.integer :number, index: true
      t.string :title
      
      t.timestamps
    end
  end
end
