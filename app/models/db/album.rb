class Db::Album < ApplicationRecord
  include Commentable
  include Loggable
  
  # This association is not optional
  belongs_to :latest_version, 
    class_name: 'Db::AlbumVersion', optional: true
  has_many :album_versions, class_name: 'Db::AlbumVersion'
  has_many :versions, -> { version_list }, class_name: 'Db::AlbumVersion'
  searchable do
  end
end
