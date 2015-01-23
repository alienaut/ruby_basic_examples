def f(x)
	(18111.0 / 2.0) * x ** 4 - 90555 * x ** 3 + (633885.0 / 2.0) * x ** 2 - 452773 * x + 217331
end

5.times do |index|
	puts f(index + 1)
end
