# Not use. LOL

class DbForm::AlbumVersion
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  delegate :title, :title_en, :title_pronounce, :note, :image_url, to: :album_version
  
  include Validators::Db::Title
  
  def initialize(album_version = nil)
    @album_version = album_version || Db::AlbumVersion.new
  end
  
  def persisted?
    false
  end

private
  
  attr_reader :album_version
end