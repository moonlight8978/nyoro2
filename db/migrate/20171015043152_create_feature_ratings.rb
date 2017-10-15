class CreateFeatureRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :feature_ratings do |t|
      t.references :user, index: true
      t.references :rateable, polymorphic: true, index: true
      t.integer :star
      
      t.timestamps
    end
  end
end
