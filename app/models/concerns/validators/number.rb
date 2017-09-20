module Validators::Number
  extend ActiveSupport::Concern
  
  included do
    validates :number,
      presence: { message: 'ディスクを空にするのができません。' },
      numericality: { only_integer: true, greater_than: 0, message: '入力したのは数ではありません' }
  end
end