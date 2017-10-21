class Feature::Rating < ApplicationRecord
  belongs_to :rated_user,
    foreign_key: :user_id, class_name: 'User'
  belongs_to :rateable,
    polymorphic: true
  belongs_to :album,
    foreign_key: :rateable_id,
    class_name: 'Db::Album'
  default_scope { order(updated_at: :desc) }
end
