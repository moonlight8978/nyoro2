class Db::SongVersion < ApplicationRecord
  include Validators::Number
  include Validators::Title
    
  belongs_to :song
  belongs_to :previous_version, 
    class_name: 'Db::SongVersion', optional: true
  
  scope :version_list, 
    -> { 
      select(:id, :previous_version_id, :song_id, :created_at)
      .order(created_at: :desc)
    }
end
