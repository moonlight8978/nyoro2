class CreateDbDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_discs do |t|
      # Each album contains many discs, but album is editable => each version has many discs
      t.references :album_version
      
      t.boolean :marked, index: true, default: false
      t.integer :number
      t.string :title
      
      t.timestamps
    end
  end
end
