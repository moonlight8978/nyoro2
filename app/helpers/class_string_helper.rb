module ClassStringHelper
  def class_string(css_map)
    classes = []

    css_map.each do |css, bool|
      classes << css if bool
    end
    
    classes.join(" ")
  end
end
