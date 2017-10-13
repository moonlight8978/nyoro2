class CreateDbCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :db_companies do |t|
      t.references :latest_version
      
      t.boolean :marked, index: true, default: false
      
      t.timestamps
    end
  end
end
