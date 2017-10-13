class CreateDbCompanyVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_company_versions do |t|
      t.references :company
      t.references :previous_version
      t.references :country
      
      t.boolean :marked, index: true, default: false
      
      t.string :name
      t.string :name_en
      t.string :name_pronounce, index: true
      t.date :established_at, index: true
      t.text :note
      
      t.timestamps
    end
    
    add_reference :db_person_versions, :country, index: true
    add_reference :users, :country, index: true
  end
end
