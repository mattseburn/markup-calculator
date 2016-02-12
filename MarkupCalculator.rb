class MarkupCalculator
    GOODS = {
        :food => 0,
        :drugs => 1,
        :books => 2,
        :electronics => 3,
        :clothing => 4
    }

    def calculate(base_price, num_people, goods)
        raise RuntimeError, "Invalid input" unless is_valid(base_price, num_people, goods)
    end

    private def is_valid(base_price, num_people, goods)
        num_people > 0 and
            GOODS.value?(goods) and
            (base_price.is_a? Integer or base_price.is_a? Float) and
            base_price >= 0
    end
end
