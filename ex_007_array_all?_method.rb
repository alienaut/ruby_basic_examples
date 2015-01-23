require 'minitest/autorun'
require 'minitest/pride'

def array_of_fixnum?(array)
	array.all? { |x| x.is_a? Fixnum }
end

class TestMethod < Minitest::Unit::TestCase
	def test_for_array_of_fixnum?
		assert array_of_fixnum? [1, 2, 3, 4, 5]
		refute array_of_fixnum? [1, "2", 3, 4, 5]
	end
end
