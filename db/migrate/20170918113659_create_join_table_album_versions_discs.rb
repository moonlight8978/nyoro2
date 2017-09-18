class CreateJoinTableAlbumVersionsDiscs < ActiveRecord::Migration[5.1]
  def change
    create_join_table :album_versions, :discs, id: false, table_name: :db_album_versions_discs  do |t|
      t.index [:album_version_id, :disc_id]
      # t.index [:disc_id, :album_version_id]
    end
  end
end
