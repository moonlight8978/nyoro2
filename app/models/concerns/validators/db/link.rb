module Validators::Db::Link
  extend ActiveSupport::Concern
  
  included do
    validates :name, 
      presence: { message: 'タイトルを空にすることはできません。' }
    validates :name_en,
      presence: { message: 'タイトル（英語／ローマ字）を空にすることはできません。' }
    validates :name_pronounce,
      presence: { message: 'タイトル（かな）を空にすることはできません。' }
  end
end