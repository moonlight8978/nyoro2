class Db::CompanyVersion < ApplicationRecord
  include MemberOfCountry
  
  belongs_to :company, 
    optional: true
  belongs_to :previous_version, 
    class_name: 'Db::CompanyVersion', optional: true
end
