module SalesPoC
  class Basket
    attr_reader :items

    def initialize(catalogue, delivery_calculator, offers)
      @catalogue = catalogue
      @delivery_calculator = delivery_calculator
      @offers = offers
      @items = []
    end

    def add(product_code)
      product = find_product(product_code)
      @items << product.dup if product
    end

    def total
      apply_offers
      subtotal = items.sum(&:final_price).round(2)
      delivery_charge = delivery_calculator.calculate(subtotal)

      (subtotal + delivery_charge).round(2)
    end

    private

    attr_reader :catalogue, :offers, :delivery_calculator

    def find_product(code)
      catalogue.find { |product| product.code == code }
    end

    def apply_offers
      offers.each { |offer| offer.apply(items) }
    end
  end
end
