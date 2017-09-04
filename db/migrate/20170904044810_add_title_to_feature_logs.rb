class AddTitleToFeatureLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :feature_logs, :title, :string
  end
end
