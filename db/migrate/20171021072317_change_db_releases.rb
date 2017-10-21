class ChangeDbReleases < ActiveRecord::Migration[5.1]
  def change
    remove_reference :db_releases, :album_version
    add_reference :db_album_versions, :release, index: true
  end
end
