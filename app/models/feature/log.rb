class Feature::Log < ApplicationRecord
  belongs_to :loggable, polymorphic: true
  belongs_to :user, class_name: 'User'
  
  scope :db_log, 
    -> { includes(:loggable, :user).where('classification = :class AND action != :action', 
                class: :db, action: :comment).order(created_at: :desc) }
end
