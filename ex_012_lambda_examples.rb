# this one runs only with ruby 2.0
addition = -> (x, y) { x + y }

# old sytnax
# addition = lambda { |x, y| x + y }

puts addition.call(1, 2)
