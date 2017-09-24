class CreateJoinTableDbAlbumsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :albums, :tags, id: false, table_name: :db_albums_tags do |t|
      t.index [:album_id, :tag_id]
      # t.index [:tag_id, :album_id]
    end
  end
end
