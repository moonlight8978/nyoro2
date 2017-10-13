class AddPublisherToDbReleases < ActiveRecord::Migration[5.1]
  def change
    add_reference :db_releases, :publisher, index: true
  end
end
