module MemberOfCountry
  extend ActiveSupport::Concern
  
  included do
    belongs_to :country, 
      class_name: 'Country', optional: true
  end
end