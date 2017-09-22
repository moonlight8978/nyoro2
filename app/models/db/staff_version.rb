class Db::StaffVersion < ApplicationRecord
  belongs_to :staff, optional: true
  belongs_to :previous_version, 
    class_name: 'Db::StaffVersion', optional: true
  belongs_to :person
  scope :version_list, 
    -> { 
      select(:id, :previous_version_id, :staff_id, :created_at)
      .order(created_at: :desc)
    }
end
