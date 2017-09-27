class X
	def initialize(rnd_number)
		@value = rnd_number
	end
	
	def loz
		p self.value
	end
end

x = X.new(2)
x.loz