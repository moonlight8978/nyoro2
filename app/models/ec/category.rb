class Ec::Category < ApplicationRecord
  belongs_to :parent,
    class_name: :'Ec::Category', optional: true
end
