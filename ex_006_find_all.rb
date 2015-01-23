require 'minitest/autorun'
require 'minitest/pride'

class Array
	def non_duplicated_values
		self.find_all { |element| self.count(element) == 1 }
	end
end

class TestArray < Minitest::Unit::TestCase
	def setup
		@array = [1, 2, 2, 3, 4, 4, 5, 1]
	end

	def test_for_non_duplicated_values
		assert_equal @array.non_duplicated_values, [3, 5]
	end
end
