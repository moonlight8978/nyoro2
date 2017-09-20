class Db::PersonVersion < ApplicationRecord
  include Validators::Name
  
  belongs_to :person
  belongs_to :previous_version, 
    class_name: 'Db::PersonVersion', optional: true
end
