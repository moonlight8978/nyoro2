class ChangeToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :db_song_versions, :number, :integer
    add_index :db_song_versions, :number
  end
end
