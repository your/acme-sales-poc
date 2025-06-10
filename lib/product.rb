require "bigdecimal/util"

module SalesPoC
  class Product
    attr_reader :code, :name, :base_price, :discount

    def initialize(code, name, base_price)
      @code = code
      @name = name
      @base_price = base_price.to_d
      @discount = 0.to_d
    end

    def apply_discount(percentage)
      @discount = (base_price * percentage.to_d).round(2)
    end

    def final_price
      (base_price - discount).round(2)
    end
  end
end
