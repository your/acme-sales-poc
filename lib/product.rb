module SalesPoC
  class Product
    attr_reader :code, :name, :base_price, :discount

    def initialize(code, name, base_price)
      @code = code
      @name = name
      @base_price = base_price.to_f
      @discount = 0
    end

    def apply_discount(percentage)
      @discount = base_price * percentage
    end

    def final_price
      base_price - discount
    end
  end
end
