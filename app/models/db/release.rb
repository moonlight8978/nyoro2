class Db::Release < ApplicationRecord
  has_and_belongs_to_many :album,
    join_table: :db_albums_releases
  has_and_belongs_to_many :album_versions,
    join_table: :db_album_versions_releases
  
  has_many :release_versions
  belongs_to :latest_version, 
    class_name: 'Db::ReleaseVersion', optional: true
end
