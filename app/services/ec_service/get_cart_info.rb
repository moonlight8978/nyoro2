module EcService
  class GetCartInfo
    def initialize(cart)
      @cart = cart
    end

    def perform
      { items: items, total: total }
    end

  private

    attr_accessor :items, :total, :cart

    def items
      @items ||= cart.map do |color_id, quantity|
        { color: ::Ec::Product::Color.find(color_id), quantity: quantity }
      end
    end

    def total
      @total ||= items.reduce(0) do |memo, item|
        memo + item[:color].price_after_discount * item[:quantity]
      end
    end
  end
end
