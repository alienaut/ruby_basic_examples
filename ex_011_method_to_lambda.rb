class Calculator
	def add(a,b)
		a + b
	end
end

addition_method = Calculator.new.method(:add)
addition = addition_method.to_proc

puts addition.class
puts addition.call(5, 6)
