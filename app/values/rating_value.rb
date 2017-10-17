class RatingValue
  attr_accessor :model
  
  def initialize(rated)
    @model = rated || Feature::Rating.new
  end
  
  def to_s
    @rated_star ||= (@model.star || '-')
  end
  
  def star
    @star ||= @model.star
  end
  
  def descr
    @descr ||=
      case star
      when 1
        'Appalling'
      when 2
        'Horrible'
      when 3
        'Very Bad'
      when 4
        'Bad'
      when 5
        'Average'
      when 6
        'Fine'
      when 7
        'Good'
      when 8
        'Very Good'
      when 9
        'Great'
      when 10
        'Masterpiece'
      else
        'No score'
      end
  end
end