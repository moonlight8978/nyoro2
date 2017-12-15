module EcService
  class CreateShopInvoices
    def initialize(**args)
      @original_invoice = args[:original_invoice]
      @ordered_products = args[:ordered_products]
      @cart_items = args[:cart_items]
      @order = args[:order]
    end

    def perform
      cart_items_group_by_shop.each do |shop_id, shop_items|
        invoice = original_invoice.shop_invoices.create(
          shop_id: shop_id,
          order_id: order,
          total: shop_items.reduce(0) do |memo, item|
            memo + item[:color].price_after_discount * item[:quantity]
          end
        )
        invoice.products = products_group_by_shop[shop_id]
      end
    end

  private

    attr_accessor :original_invoice, :ordered_products, :cart_items, :order,
      :products_group_by_shop, :cart_items_group_by_shop

    def products_group_by_shop
      @products_group_by_shop ||= ordered_products.group_by do |ordered|
        ordered.product.shop_id
      end
    end

    def cart_items_group_by_shop
      @cart_items_group_by_shop ||= cart_items.group_by do |item|
        item[:color].product.shop_id
      end
    end
  end
end
