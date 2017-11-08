class EcForm::Storage
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :color, :storage

  delegate :total, to: :storage

  def storage
    @storage ||= color.build_storage
  end

  def assign_new_attributes(new_attributes)
    storage.assign_attributes(new_attributes)
  end
end
