class Feature::Rating < ApplicationRecord
  belongs_to :rated_user, 
    foreign_key: :user_id, class_name: 'User'
  belongs_to :rateable,
    polymorphic: true
  default_scope { order(updated_at: :desc) }
end
