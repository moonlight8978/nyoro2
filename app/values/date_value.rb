class DateValue
  attr_reader :price, :currency

  def initialize(date)
    @date = date
  end

  def to_s
    @date.present? ? @date.strftime('%Y-%m-%d') : '不明'
  end
end
