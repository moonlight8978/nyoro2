class CreateDbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :db_people do |t|
      t.references :latest_version
      t.boolean :marked, index: true, default: false
      t.timestamps
    end
  end
end
