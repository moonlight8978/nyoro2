class CreateDbReleaseVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_release_versions do |t|
      t.references :release
      t.references :previous_version
      
      t.float :price
      t.string :currency
      t.string :format
      t.date :released_at, index: true
      t.string :catalog_number, index: true
      t.text :note
      
      t.timestamps
    end
  end
end
