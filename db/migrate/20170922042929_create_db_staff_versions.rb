class CreateDbStaffVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_staff_versions do |t|
      t.references :staff
      t.references :previous_version
      
      t.boolean :marked, index: true, default: false
      
      t.references :person
      t.string :position
      t.string :alias
      t.string :alias_en
      t.string :alias_pronounce, index: true
      t.text :note
      
      t.timestamps
    end
  end
end
