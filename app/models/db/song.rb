class Db::Song < ApplicationRecord
  include Commentable
  include Loggable
  
  belongs_to :latest_version, 
    class_name: 'Db::SongVersion', optional: true
  belongs_to :disc
  
  has_many :song_versions
  has_many :versions, 
    -> { version_list }, class_name: 'Db::SongVersion'
end
