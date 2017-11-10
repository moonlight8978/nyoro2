class Ec::Product < ApplicationRecord
  MAX_PRICE = 1_000_000
  MIN_PRICE = 0
  # associations
  belongs_to :shop,
    class_name: :'Ec::ApprovedShop'
  has_one :discount,
    class_name: :'Ec::Product::Discount', dependent: :delete
  has_many :colors,
    class_name: :'Ec::Product::Color', dependent: :delete_all
  has_many :images,
    class_name: :'Ec::Product::Image', dependent: :delete_all
  belongs_to :category,
    class_name: :'Ec::Category'

  # scopes
  scope :with_price_range,-> {
    joins(:colors)
      .select(
        "ec_products.*, " \
        "max(ec_product_colors.price) as max_price, " \
        "min(ec_product_colors.price) as min_price"
      )
      .group("ec_products.id")
  }
  # class methods
  searchable do
    text :name
    integer :max_price do
      self.colors.any? ? self.colors.maximum(:price) : MAX_PRICE
    end
    integer :min_price do
      self.colors.any? ? self.colors.minimum(:price) : MIN_PRICE
    end
    text :category do
      self.category.name
    end
  end
  # validates
  # callbacks
  # instance methods
end
