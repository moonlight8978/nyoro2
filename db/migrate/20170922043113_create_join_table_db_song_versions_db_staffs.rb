class CreateJoinTableDbSongVersionsDbStaffs < ActiveRecord::Migration[5.1]
  def change
    create_join_table :song_versions, :staffs, id: false, table_name: :db_song_versions_staffs do |t|
      t.index [:song_version_id, :staff_id]
    end
  end
end
