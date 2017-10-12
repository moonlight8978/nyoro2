class AddAlbumVersionToReleaseVersion < ActiveRecord::Migration[5.1]
  def change
    drop_table :db_release_versions if ActiveRecord::Base.connection.table_exists? 'db_release_versions'
    drop_table :db_releases if ActiveRecord::Base.connection.table_exists? 'db_releases'
    create_table :db_releases do |t|
      t.references :album_version
      
      t.float :price
      t.string :currency
      t.string :format
      t.date :released_at, index: true
      t.string :catalog_number, index: true
      t.text :note
      
      t.timestamps
    end
  end
end
