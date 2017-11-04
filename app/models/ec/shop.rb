class Ec::Shop < ApplicationRecord
  self.inheritance_column = :type

  belongs_to :user,
    class_name: :'User'
end
