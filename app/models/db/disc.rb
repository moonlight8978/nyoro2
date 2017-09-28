class Db::Disc < ApplicationRecord  
  include Db::Validators::Number
    
  has_and_belongs_to_many :album_versions, 
    join_table: :db_album_versions_discs
  has_many :songs
end
