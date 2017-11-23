class Ec::Payment < ApplicationRecord
  # associations
  self.inheritance_column = :type
  
  belongs_to :user,
    class_name: 'User'
  # scopes
  # class methods
  # validates
  # callbacks
  # instance methods
end
