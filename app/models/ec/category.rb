class Ec::Category < ApplicationRecord
  belongs_to :parent,
    class_name: :'Ec::Category', optional: true
  has_many :subs,
    class_name: :'Ec::Category', foreign_key: :parent_id

  scope :selectable,
    -> { where.not(
      "id IN (SELECT parent_id FROM ec_categories WHERE parent_id IS NOT NULL) " \
      "OR id IS NULL"
    ) }
end