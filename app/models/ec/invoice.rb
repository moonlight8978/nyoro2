class Ec::Invoice < ApplicationRecord
  belongs_to :order,
    class_name: 'Ec::Order', optional: true
end
