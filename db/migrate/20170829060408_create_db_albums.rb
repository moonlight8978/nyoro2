class CreateDbAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :db_albums do |t|
      # latest version
      t.references :latest_version, index: true
      
      t.boolean :marked, index: true, default: false
      
      t.timestamps
    end
    
    add_index :db_albums, :created_at
    add_index :db_albums, :updated_at
  end
end
