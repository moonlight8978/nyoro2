class Db::StaffVersion < ApplicationRecord
  # associations
  belongs_to :staff, optional: true
  belongs_to :previous_version, 
    class_name: 'Db::StaffVersion', optional: true
  belongs_to :person, optional: true
  # scopes
  scope :version_list, 
    -> { 
      select(:id, :previous_version_id, :staff_id, :created_at)
      .order(created_at: :desc)
    }
    
  # class methods
  
  # validates
  # validates :alias, 
  #   presence: { message: 'アリアスを空にすることはできません。' }
  # validates :alias_en,
  #   presence: { message: 'アリアス（英語／ローマ字）を空にすることはできません。' }
  # validates :alias_pronounce,
  #   presence: { message: 'アリアス（かな）を空にすることはできません。' }
  validates :position,
    presence: true, 
    inclusion: { 
      in: %w(Vocal Lyrics Compose Arrange), 
      message: "役割は#{%w(Vocal Lyrics Compose Arrange)}に以内あることが必要です。"
    }
  validates :person, 
    presence: { message: 'このスタッフがデータベースにいません。' }
  # callbacks
  
  # instance methods
  def title
    self.alias.present? ? self.alias : person.title
  end
end
