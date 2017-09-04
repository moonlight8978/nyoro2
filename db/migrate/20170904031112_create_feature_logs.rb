class CreateFeatureLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :feature_logs do |t|
      t.references :user, index: true
      t.references :loggable, polymorphic: true, index: true
      t.string     :classification, index: true
      t.string     :action
      t.text       :description
      t.index      [:classification, :action]
      
      t.timestamps
    end
  end
end
