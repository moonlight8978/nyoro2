class CostRangeValue
  def initialize(min:, max:)
    @min = min
    @max = max
  end

  def to_s
    "#{@min - @max}"
  end

  def method

  end
end
