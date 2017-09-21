class Db::Person < ApplicationRecord
  include Loggable
  include Commentable
  
  belongs_to :latest_version, 
    class_name: 'Db::PersonVersion', optional: true
  has_many :person_versions
  has_many :versions, 
    -> { version_list }, class_name: 'Db::PersonVersion'
end
