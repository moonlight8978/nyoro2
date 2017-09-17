class Db::Disc < ApplicationRecord  
  validates :number,
    presence: { message: 'ディスクを空にするのができません。' },
    numericality: { only_integer: true, greater_than: 0, message: '入力したのは数ではありません' }
    
  belongs_to :album_version
  has_many :songs
end
