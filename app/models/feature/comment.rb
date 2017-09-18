class Feature::Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user, class_name: 'User', counter_cache: true
  
  default_scope { order(created_at: :desc)}
end
