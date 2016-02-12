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

    def test_unusual_valid_input
        assert_equal 0.00, @calculator.calculate(0.00, 1, MarkupCalculator::GOODS[:electronics])
        assert_equal 0.00, @calculator.calculate(0.00, 2, MarkupCalculator::GOODS[:food])
        assert_equal 0.00, @calculator.calculate(0.00, 6, MarkupCalculator::GOODS[:drugs])
    end

    def test_invalid_input
        assert_raises(RuntimeError) { @calculator.calculate(1225.45, 0, MarkupCalculator::GOODS[:food]) }
        assert_raises(RuntimeError) { @calculator.calculate(1225.45, -7, MarkupCalculator::GOODS[:books]) }
        assert_raises(RuntimeError) { @calculator.calculate(5274.56, 1, "clothing") }
        assert_raises(RuntimeError) { @calculator.calculate(-4564.40, 1, MarkupCalculator::GOODS[:drugs]) }
        assert_raises(RuntimeError) { @calculator.calculate("Not a number", 5, MarkupCalculator::GOODS[:electronics]) }
    end

    def test_valid_input_with_materials_markup
        assert_equal 3001.82, @calculator.calculate(2545.75, 4, MarkupCalculator::GOODS[:drugs])
        assert_equal 548.26, @calculator.calculate(452.47, 2, MarkupCalculator::GOODS[:food])
        assert_equal 80463.62, @calculator.calculate(70955.57, 5, MarkupCalculator::GOODS[:electronics])
    end

    def test_valid_input_without_materials_markup
        assert_equal 6989.81, @calculator.calculate(6425.64, 3, MarkupCalculator::GOODS[:books])
        assert_equal 10261.17, @calculator.calculate(9656.66, 1, MarkupCalculator::GOODS[:clothing])
    end
end
