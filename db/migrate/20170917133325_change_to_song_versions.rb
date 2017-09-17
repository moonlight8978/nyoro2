class ChangeToSongVersions < ActiveRecord::Migration[5.1]
  def change
    add_reference :db_songs, :latest_version
  end
end
