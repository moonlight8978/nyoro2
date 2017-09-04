class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.string :name, index: true
      
      t.timestamps
    end
  end
end
