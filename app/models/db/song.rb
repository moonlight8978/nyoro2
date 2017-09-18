class Db::Song < ApplicationRecord
  include Commentable
  
  has_many :song_versions
  belongs_to :latest_version, class_name: 'Db::SongVersion', optional: true
  belongs_to :disc, counter_cache: true
end
