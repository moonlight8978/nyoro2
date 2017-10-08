class CreateJoinTableAlbumVersionsReleases < ActiveRecord::Migration[5.1]
  def change
    create_join_table :album_versions, :releases, 
      id: false, table_name: :db_album_versions_releases do |t|
        
      t.index [:album_version_id, :release_id], name: :index_db_album_versions_releases
      # t.index [:release_id, :album_version_id]
    end
  end
end
