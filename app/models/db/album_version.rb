class Db::AlbumVersion < ApplicationRecord
  after_initialize :set_default_values
  
  include Validators::Title
  include ImageUploadable
  
  belongs_to :album, 
    class_name: 'Db::Album'
  belongs_to :previous_version, 
    class_name: 'Db::AlbumVersion', optional: true
  
  scope :version_list, 
    -> { 
      select(:id, :previous_version_id, :album_id, :created_at)
      .order(created_at: :desc)
    }
  
  has_and_belongs_to_many :discs, 
    join_table: :db_album_versions_discs
  
private
  
  def set_default_values
    self.marked = false
  end
end
