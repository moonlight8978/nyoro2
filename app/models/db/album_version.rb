class Db::AlbumVersion < ApplicationRecord
  after_initialize :set_default_values
  
  validates :title, 
    presence: { message: 'タイトルを空にすることはできません。' }
  validates :title_en,
    presence: { message: 'タイトル（英語／ローマ字）を空にすることはできません。' }
  validates :title_pronounce,
    presence: { message: 'タイトル（発音）を空にすることはできません。' }
  mount_uploader :image, ImageUploader
  
  belongs_to :album, class_name: 'Db::Album'
  belongs_to :previous_version, class_name: 'Db::AlbumVersion', optional: true
  
  scope :version_list, -> { 
    select(:id, :previous_version_id, :album_id, :created_at)
    .order(created_at: :desc)
  }
  
private
  
  def set_default_values
    self.marked = false
  end
end
