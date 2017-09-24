class Db::Album < ApplicationRecord
  include Commentable
  include Loggable
  
  # This association is not optional
  belongs_to :latest_version, 
    class_name: 'Db::AlbumVersion', optional: true
  has_many :album_versions, 
    class_name: 'Db::AlbumVersion'
  has_many :versions, 
    -> { version_list }, class_name: 'Db::AlbumVersion'
  has_and_belongs_to_many :tags,
    join_table: :db_albums_tags
  
  searchable do
  end
end
