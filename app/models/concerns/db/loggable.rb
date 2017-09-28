module Db::Loggable
  extend ActiveSupport::Concern
  
  included do
    has_many :logs, as: :loggable, class_name: 'Feature::Log'
    
    def log_create(user, title, description)
      self.logs.create(
        user: user,
        classification: :db, 
        action: :create, 
        description: description,
        title: title
      )
    end
    
    def log_update(user, title, description)
      self.logs.create(
        user: user,
        classification: :db, 
        action: :update, 
        description: description,
        title: title
      )
    end
    
    def log_destroy(user, title, description)
      self.logs.create(
        user: user,
        classification: :db, 
        action: :destroy, 
        description: description,
        title: title
      )
    end
    
    def log_comment(user, title, description)
      self.logs.create(
        user: user,
        classification: :db, 
        action: :comment, 
        description: description,
        title: title
      )
    end
  end
end