class CostValue
  attr_reader :price, :currency
  
  def initialize(price, currency)
    @price = price
    @currency = currency
  end
  
  def to_s
    @price && @currency ? "#{@price} #{currency}" : '非売品'
  end
end