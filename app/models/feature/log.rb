class Feature::Log < ApplicationRecord
  belongs_to :loggable, polymorphic: true
  belongs_to :user, class_name: 'User'
  after_create_commit :stream_logs
  
  scope :db_log, 
    -> { includes(:loggable, :user).where('classification = :class AND action != :action', 
                class: :db, action: :comment).order(created_at: :desc) }
  
  scope :db_edit, 
    -> { where('classification = :class AND action != :action', class: :db, action: :comment) }
  
  scope :db_create,
    -> { where('classification = :class AND action != :action', class: :db, action: :create) } 
    
  scope :db_comment,
    -> { where('classification = :class AND action = :action', class: :db, action: :comment) }
    
private
  
  def stream_logs
    LogsJob.perform_later
  end
end
