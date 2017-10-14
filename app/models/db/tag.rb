class Db::Tag < ApplicationRecord
  include Db::Loggable
  include Commentable
  include Db::Validators::Name
  include AliasTitle
  
  has_and_belongs_to_many :albums,
    join_table: :db_albums_tags
    
  searchable do
    text :name, boost: 2, :stored => true
    text :name_en, boost: 2, :stored => true
    text :name_pronounce, :stored => true
  end
end
