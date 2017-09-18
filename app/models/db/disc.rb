class Db::Disc < ApplicationRecord  
  validates :number,
    presence: { message: 'ディスクを空にするのができません。' },
    numericality: { only_integer: true, greater_than: 0, message: '入力したのは数ではありません' }
    
  has_and_belongs_to_many :album_versions, join_table: :db_album_versions_discs
  has_many :songs
end
