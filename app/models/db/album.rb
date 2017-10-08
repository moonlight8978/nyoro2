class Db::Album < ApplicationRecord
  include Commentable
  include Db::Loggable
  
  # This association is not optional
  belongs_to :latest_version, 
    class_name: 'Db::AlbumVersion', optional: true
  has_many :album_versions, 
    class_name: 'Db::AlbumVersion'
  has_many :versions, 
    -> { version_list }, class_name: 'Db::AlbumVersion'
  has_and_belongs_to_many :tags,
    join_table: :db_albums_tags
  has_and_belongs_to_many :releases,
    join_table: :db_albums_releases
  
  searchable do
    text :title, boost: 2, :stored => true do
      latest_version.title
    end
    text :title_en, boost: 2, :stored => true do
      latest_version.title_en
    end
    text :title_pronounce, :stored => true do
      latest_version.title_pronounce
    end
  end
end
