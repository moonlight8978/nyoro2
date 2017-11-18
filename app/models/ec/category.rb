class Ec::Category < ApplicationRecord
  # associations
  belongs_to :parent,
    class_name: :'Ec::Category', optional: true
  has_many :subs,
    class_name: :'Ec::Category', foreign_key: :parent_id

  # scopes
  scope :selectable,
    -> { where.not(
      "id IN (SELECT parent_id FROM ec_categories WHERE parent_id IS NOT NULL) " \
      "OR id IS NULL"
    ) }
  scope :first_class,
    -> { where(parent_id: nil) }

  # class methods
  # validates
  # callbacks
  # instance methods
end
