class CreateDbSongVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_song_versions do |t|
      t.references :previous_version, index: true
      t.references :song, index: true
      
      t.boolean :marked, index: true, default: false
      t.string :title
      t.string :title_en
      t.string :title_pronounce, index: true
      t.string :length
      t.integer :number, index: true

      t.timestamps
    end
  end
end
