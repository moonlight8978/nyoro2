module Validators::Db::Name
  extend ActiveSupport::Concern
  
  included do
    validates :name, 
      presence: { message: '名前を空にすることはできません。' }
    validates :name_en,
      presence: { message: '名前（英語／ローマ字）を空にすることはできません。' }
    validates :name_pronounce,
      presence: { message: '名前（かな）を空にすることはできません。' }
  end
end