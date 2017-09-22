class Db::SongVersion < ApplicationRecord
  include Validators::Db::Number
  include Validators::Db::Title
    
  belongs_to :song
  belongs_to :previous_version, 
    class_name: 'Db::SongVersion', optional: true
  has_and_belongs_to_many :staffs,
    join_table: :db_song_versions_staffs
  
  scope :version_list, 
    -> { 
      select(:id, :previous_version_id, :song_id, :created_at)
      .order(created_at: :desc)
    }
    
  def staffs_group_by_position
    staffs.size > 0 ? group_staffs_by_position : {}
  end
  
private
  
  def group_staffs_by_position
    staffs.group_by { |staff| staff.latest_version.position }
  end
end
