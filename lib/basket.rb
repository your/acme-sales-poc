module SalesPoC
  class Basket
    attr_reader :items

    # @param catalogue [Array<Product>] List of available products
    # @param delivery_calculator [DeliveryCalculator] Calculator for shipping costs
    # @param offers [Array<Offer>] List of available offers
    # @return [void]
    def initialize(catalogue, delivery_calculator, offers)
      @catalogue = catalogue
      @delivery_calculator = delivery_calculator
      @offers = offers
      @items = []
    end

    # @param product_code [String] Code identifying the product
    # @return [Product, nil]
    def add(product_code)
      product = find_product(product_code)
      @items << product.dup if product
    end

    # @return [Float] Final price including discounts and delivery
    def total
      apply_offers
      subtotal = items.sum(&:final_price).round(2)
      delivery_charge = delivery_calculator.calculate(subtotal)

      (subtotal + delivery_charge).round(2).to_f
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
