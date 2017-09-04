class CreateFeatureComments < ActiveRecord::Migration[5.1]
  def change
    create_table :feature_comments do |t|
      t.references :user, index: true
      t.references :commentable, polymorphic: true, index: true
      t.text       :body
      
      t.timestamps
    end
  end
end
