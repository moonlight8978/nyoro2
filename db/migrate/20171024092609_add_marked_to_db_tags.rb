class AddMarkedToDbTags < ActiveRecord::Migration[5.1]
  def change
    add_column :db_tags, :marked, :boolean, index: true, default: false
    add_column :db_releases, :marked, :boolean, index: true, default: false
  end
end
