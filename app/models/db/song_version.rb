class Db::SongVersion < ApplicationRecord
  validates :title, 
    presence: { message: 'タイトルを空にすることはできません。' }
  validates :title_en,
    presence: { message: 'タイトル（英語／ローマ字）を空にすることはできません。' }
  validates :title_pronounce,
    presence: { message: 'タイトル（かな）を空にすることはできません。' }
    
  belongs_to :song
  belongs_to :previous_version, class_name: 'Db::SongVersion', optional: true
end
