require "minitest/autorun"
require "./MarkupCalculator"

class TestMarkupCalculator < MiniTest::Test
    def setup
        @calculator = MarkupCalculator.new
    end

    def test_examples
        assert_equal @calculator.calculate(1299.99, 3, MarkupCalculator::GOODS[:food]),     1591.58
        assert_equal @calculator.calculate(5432.00, 1, MarkupCalculator::GOODS[:drugs]),    6199.81
        assert_equal @calculator.calculate(12456.95, 4, MarkupCalculator::GOODS[:books]),   13707.63
    end
end
