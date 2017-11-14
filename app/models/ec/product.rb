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
    text :name, boost: 3
    integer :max_price, :stored => true do
      self.colors.any? ? self.colors.maximum(:price) : MAX_PRICE
    end
    integer :min_price, :stored => true do
      self.colors.any? ? self.colors.minimum(:price) : MIN_PRICE
    end
    string :category, :stored => true do
      self.category.name
    end
    integer :shop_id, :references => Ec::Shop
    integer :category_id, :references => Ec::Category
  end

  def self.search_and_filter(**args)
    self.search(include: args[:associations]) do
      fulltext args[:q],
        fields: [:name] if args[:q].present?
      with(:category, args[:types]) if args[:types].present?
      with(:min_price).greater_than_or_equal_to(args[:min_price] || MIN_PRICE)
      with(:max_price).less_than_or_equal_to(args[:max_price] || MAX_PRICE)
      with(:shop_id, args[:shop_id]) if args[:shop_id].present?
      with(:category_id, args[:category_id]) if args[:category_id].present?
      paginate page: 1, per_page: 20
    end
  end
  # validates
  # callbacks
  # instance methods
  def min_price
    colors.minimum(:price)
  end

  def max_price
    colors.maximum(:price)
  end
end
