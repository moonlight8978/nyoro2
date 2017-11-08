## 1
# class X
#
# protected
#
#   def hello
#     p :hello
#   end
# end
#
# class Y < X
#   def hallo
#     self.hello
#   end
# end
#
# Y.new.hallo


## 2
# class X
#   attr_accessor :var
# end
#
# x = X.new(var: 3)
# x.instance_variables
