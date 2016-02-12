require "minitest/autorun"
require "./MarkupCalculator"

class TestMarkupCalculator < MiniTest::Test
    def setup
        @calculator = MarkupCalculator.new
    end

    def test_examples
        assert_equal 1591.58, @calculator.calculate(1299.99, 3, MarkupCalculator::GOODS[:food])
        assert_equal 6199.81, @calculator.calculate(5432.00, 1, MarkupCalculator::GOODS[:drugs])
        assert_equal 13707.63, @calculator.calculate(12456.95, 4, MarkupCalculator::GOODS[:books])
    end
end
