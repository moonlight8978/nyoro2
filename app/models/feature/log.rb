class Feature::Log < ApplicationRecord
  belongs_to :loggable, polymorphic: true
  belongs_to :user, class_name: 'User'
  after_create_commit :stream_logs
  
  scope :db_log, 
    -> { includes(:loggable, :user).where('classification = :class AND action != :action', 
                class: :db, action: :comment).order(created_at: :desc) }
                  
private
  
  def stream_logs
    LogsJob.perform_later
  end
end
