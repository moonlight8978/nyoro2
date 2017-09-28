module Db::Validators::Title
  extend ActiveSupport::Concern
  
  included do
    validates :title, 
      presence: { message: 'タイトルを空にすることはできません。' }
    validates :title_en,
      presence: { message: 'タイトル（英語／ローマ字）を空にすることはできません。' }
    validates :title_pronounce,
      presence: { message: 'タイトル（かな）を空にすることはできません。' }
  end
end