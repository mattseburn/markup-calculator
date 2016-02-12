class MarkupCalculator
    GOODS = {
        :food => 0,
        :drugs => 1,
        :books => 2,
        :electronics => 3,
        :clothing => 4
    }

    GOODS_MARKUPS = {
        0 => 0.13,
        1 => 0.75,
        2 => 0,
        3 => 0.02,
        4 => 0
    }

    FLAT_MARKUP = 0.05
    PER_PERSON_MARKUP = 0.012

    private_constant :GOODS_MARKUPS, :FLAT_MARKUP, :PER_PERSON_MARKUP

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
