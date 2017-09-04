class CreateJoinTableUsersUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :roles, id: false, table_name: :users_user_roles do |t|
      t.index [:user_id, :role_id]
      # t.index [:user_role_id, :user_id]
    end
  end
end
