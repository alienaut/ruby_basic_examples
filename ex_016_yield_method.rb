def calculation(a, b)
  yield(a, b)
end

puts calculation(5, 6) { |a, b| a + b }
puts calculation(5, 6) { |a, b| a -b }

