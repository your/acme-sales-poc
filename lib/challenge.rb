class OfferStrategy
  attr_reader :product_code

  def initialize(product_code)
    @product_code = product_code
  end

  def apply(items)
    raise NotImplementedError
  end
end

class BuyOneGetOneHalfPriceOffer < OfferStrategy
  def apply(items)
    # TODO: Invoke Product#apply_discount on products relevant to the offer
  end
end

class DeliveryChargeCalculator
  def initialize(rules)
    @rules = rules
  end

  def calculate(subtotal)
    # TODO: apply rules
    return 0
  end
end

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

class Basket
  attr_reader :items

  def initialize(catalogue, delivery_calculator, offers)
    @catalogue = catalogue
    @delivery_calculator = delivery_calculator
    @offers = offers
    @items = [] # Should be an array of initialised Products
  end

  def add(product_code)
    product = find_product(product_code)
    @items << product.dup if product
  end

  def total
    apply_offers
    subtotal = items.sum(&:final_price)
    delivery_charge = delivery_calculator.calculate(subtotal)

    subtotal + delivery_charge
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

# delivery_rules = [
#   { min: 0, max: 50, charge: 4.95 },
#   { min: 50, max: 90, charge: 2.95 },
#   { min: 90, max: Float::INFINITY, charge: 0 }
# ]

# catalogue = [
#   Product.new("R01", "Red Widget", 32.95),
#   Product.new("G01", "Green Widget", 24.95),
#   Product.new("B01", "Blue Widget", 7.95)
# ]

# red_widget_offer = BuyOneGetOneHalfPriceOffer.new("R01")
# delivery_calculator = DeliveryChargeCalculator.new(delivery_rules)
# basket = Basket.new(catalogue, delivery_calculator, [red_widget_offer])

# basket.add("R01")
# basket.add("R01")
# basket.total
