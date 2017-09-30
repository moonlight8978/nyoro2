class Feature::Comment < ApplicationRecord
  include Db::Loggable
  # associations
  belongs_to :commentable, polymorphic: true
  belongs_to :user, class_name: 'User'
  
  # scopes
  default_scope { order(created_at: :desc) }
  
  # instance methods
  def can_be_edited_by(user)
    user == self.user
  end
end
