class CreateJoinTableDbAlbumsDbCompanies < ActiveRecord::Migration[5.1]
  def change
    create_join_table :albums, :companies, table_name: :db_albums_companies, id: false do |t|
      t.index [:album_id, :company_id]
      # t.index [:company_id, :album_id]
    end
  end
end
