class EcForm::Storage
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :color, :storage

  delegate :total, :quantity, to: :storage

  validates :quantity,
    presence: true,
    numericality: {
      only_integer: true ,
      greater_than: 0,
      message: 'Total must be integer and greater than 0 eg 1, 2, ...'
    }

  def storage
    @storage ||= color.build_storage
  end

  def assign_new_attributes(new_attributes)
    storage.assign_attributes(new_attributes)
  end
end
