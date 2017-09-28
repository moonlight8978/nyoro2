class Db::Tag < ApplicationRecord
  include Db::Loggable
  include Commentable
  include Db::Validators::Name
  
  has_and_belongs_to_many :albums,
    join_table: :db_albums_tags
    
  searchable do
    text :name, boost: 3
    text :name_en
    text :name_pronounce
  end
end
