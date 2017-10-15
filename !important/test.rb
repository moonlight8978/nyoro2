class X
  
protected
  
  def hello
    p :hello
  end
end

class Y < X
  def hallo
    self.hello
  end
end

Y.new.hallo
