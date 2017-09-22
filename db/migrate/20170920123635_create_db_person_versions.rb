class CreateDbPersonVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_person_versions do |t|
      t.references :person
      t.references :previous_version
      
      t.boolean :marked, index: true, default: false
      t.string :name
      t.string :name_en
      t.string :name_pronounce, index: true
      t.date :birthday
	    t.boolean :gender
	    t.string :blood_type
      t.string :website
      t.string :twitter
      t.text :note
      
      t.timestamps
    end
  end
end
