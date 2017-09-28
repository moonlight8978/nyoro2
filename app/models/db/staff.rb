class Db::Staff < ApplicationRecord
  # Associations
  belongs_to :latest_version, 
    class_name: 'Db::StaffVersion'
  has_many :staff_versions
  has_many :versions, 
    -> { version_list }, class_name: 'Db::StaffVersion'
  has_and_belongs_to_many :song_versions,
    join_table: :db_song_versions_staffs
end
