class CreateDbAlbumVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_versions do |t|
      # album has many album_versions
      t.references :previous_version, index: true
      t.references :album, index: true
      
      t.boolean :marked, index: true, default: false
      t.string :title
      t.string :title_en
      t.string :title_pronounce, index: true
      t.string :image
      t.text :note
      
      t.timestamps
    end
  end
end
