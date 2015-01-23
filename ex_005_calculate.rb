require 'minitest/autorun'

def calculate(*arguments)
  if arguments.last.is_a?(Hash)
    options = arguments.pop
  else
    options = {}
  end
  
  if options[:subtract]
    subtract(*arguments)
  else
    add(*arguments)
  end
end

def add(*numbers)
  numbers.inject(0) { |sum, number| sum += number }
end

def subtract(*numbers)
  numbers[1, (numbers.length - 1)].inject(numbers[0]) { |subtract, number| subtract -= number }
end

class TestCalculator < MiniTest::Unit::TestCase
  def test_for_sum
    assert_equal add(1, 3), 4
  end

  def test_for_subtraction
    assert_equal subtract(1, 3), -2
  end

  def test_for_calculate
    assert_equal calculate(1, 3), 4
  end
end
