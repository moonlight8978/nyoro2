class CreateJoinTableAlbumsReleases < ActiveRecord::Migration[5.1]
  def change
    create_join_table :albums, :releases,
      id: false, table_name: :db_albums_releases do |t|
        
      t.index [:album_id, :release_id], name: :index_db_albums_releases
      # t.index [:release_id, :album_id]
    end
  end
end
