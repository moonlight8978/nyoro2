class Db::Song < ApplicationRecord
  has_many :song_versions
  belongs_to :latest_version, class_name: 'Db::SongVersion', optional: true
end
