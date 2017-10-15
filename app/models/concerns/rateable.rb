module Rateable
  extend ActiveSupport::Concern
  
  included do
    has_many :ratings, 
      as: :rateable, class_name: 'Feature::Rating'
    has_many :rated_users, 
      through: :ratings, class_name: 'User'
  end
end