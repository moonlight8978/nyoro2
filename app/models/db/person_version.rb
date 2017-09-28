class Db::PersonVersion < ApplicationRecord
  include Db::Validators::Name
  
  enum gender: %w(female male)
  
  belongs_to :person, optional: true
  belongs_to :previous_version, 
    class_name: 'Db::PersonVersion', optional: true
    
  scope :version_list, 
    -> { 
      select(:id, :previous_version_id, :person_id, :created_at)
      .order(created_at: :desc)
    }
end
