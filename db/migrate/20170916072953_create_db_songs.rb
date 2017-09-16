class CreateDbSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_songs do |t|
      t.references :song_version
      
      t.boolean :marked, index: true, default: false
      
      t.timestamps
    end
  end
end
