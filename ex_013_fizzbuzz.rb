require "minitest/autorun"
require "minitest/pride"

class Fixnum
	def multiple_of?(number)
		!number.zero? ? (self % number).zero? : true	
	end
end

class FizzBuzz
	def print(numbers)
		if numbers.respond_to?(:map)
			numbers.map { |number| test(number) }
		else
			test(numbers)
		end
	end

	private
		def test(number) 
			raise ArgumentError unless number > 0
			raise ArgumentError, "Integers only." unless number.is_a? Fixnum

			if number.multiple_of?(15)
				"FizzBuzz"
			elsif number.multiple_of?(3)
				"Fizz"
			elsif number.multiple_of?(5)
				"Buzz"
			else
				number.to_s
			end
		end
end

describe "FizzBuzz" do
	before do
		@fb = FizzBuzz.new
		@number = 15 * rand(1..100) + 1
	end

	it "has print method" do
		@fb.must_respond_to :print
	end

	it "returns Fizz for multiples of 3" do
		@fb.print(3 * @number).must_equal "Fizz"
	end

	it "returns Buzz for multiples of 5" do
		@fb.print(5 * @number).must_equal "Buzz"
	end

	it "retuns FizzBuzz for multiples of 15" do
		@fb.print(15 * @number).must_equal "FizzBuzz"
	end

	it "returns the number as a string for all non FizzBuzz numbers" do
		@fb.print(@number).must_equal @number.to_s
	end

	it "doesn't say FizzBuzz when it shouldn't" do
		@fb.print(@number).wont_equal "FizzBuzz'"
	end

	it "returns an Array object when a range is given as an argument" do
		@fb.print(1..5).must_be_instance_of Array		
	end

	it "raises error if the number is negative" do
		proc { @fb.print(-2) }.must_raise ArgumentError
	end

	it "raises error if the number is zero" do
		proc { @fb.print(0) }.must_raise ArgumentError
	end

	it "raises error if the number is not an Integer" do
		proc { @fb.print(2.5) }.must_raise ArgumentError
	end
end

describe "Fixnum" do
	before do
		@number = rand(2..100)
	end

	it "should return true for if parameter multiple of integer" do
		10.times do |index|
			(index * @number).multiple_of?(@number).must_equal true
		end
		
		15.multiple_of?(5).must_equal true
		10.multiple_of?(2).must_equal true
		9.multiple_of?(9).must_equal true
	end

	it "should return false if paramter is not multiple of integer" do
		20.times do |index|
			(index * @number + 1).multiple_of?(@number).wont_equal true
		end
		15.multiple_of?(7).must_equal false
		15.multiple_of?(7).must_equal false
		15.multiple_of?(7).must_equal false
	end
end
