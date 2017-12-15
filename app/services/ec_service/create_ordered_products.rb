module EcService
  class CreateOrderedProducts
    def initialize(cart_items)
      @cart_items = cart_items
    end

    def perform
      @cart_items.map do |cart_item|
        create_order_product(cart_item)
      end
    end

  private

    def create_order_product(cart_item)
      ::Ec::Order::Product.create(
        product_id: cart_item[:color].product_id,
        price: cart_item[:color].price,
        quantity: cart_item[:quantity],
        color: cart_item[:color].name,
        shop_discount: cart_item[:color].product.discount.shop,
        system_discount: cart_item[:color].product.discount.system
      )
    end
  end
end
