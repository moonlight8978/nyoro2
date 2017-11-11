class EcForm::Color
  # TODO refactor
  include ActiveModel::Dirty
  include ActiveModel::Model

  attr_accessor :product, :color, :storage_form

  delegate :product_id, :name, :price, to: :color

  validates :name,
    presence: true
  validates :price,
    presence: true

  def both_valid?
    valid? && storage_form.valid?
  end

  def color
    @color ||= product.colors.build
  end

  def storage_form
    @storage_form ||= EcForm::Storage.new(storage: color.storage || color.build_storage)
  end

  def assign_new_attributes(new_attributes)
    color.assign_attributes(new_attributes)
  end

  def create(**params_of)
    assign_new_attributes(params_of[:color])
    storage_form.assign_new_attributes(params_of[:storage])

    if both_valid?
      EcService::CreateColor
        .new(
          product: product,
          color_params: params_of[:color],
          storage_params: params_of[:storage]
        )
        .perform
      true
    else
      false
    end
  end

  def update(**params_of)
    assign_new_attributes(params_of[:color])
    storage_form.assign_new_attributes(params_of[:storage])

    if both_valid?
      EcService::UpdateColor
        .new(
          color: color,
          color_params: params_of[:color],
          storage_params: params_of[:storage]
        )
        .perform
      true
    else
      false
    end
  end
end
