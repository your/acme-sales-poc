module SalesPoC
  require_relative "offers"
  require_relative "delivery/charge_calculator"
  require_relative "product"
  require_relative "basket"

  require_relative "seeds/delivery_rules"
  require_relative "seeds/product_catalogue"

  class << self
    def new_basket
      offers = [Offers::BuyOneGetOneHalfPriceOffer.new("R01")]
      delivery_calculator = Delivery::ChargeCalculator.new(DELIVERY_RULES)

      Basket.new(PRODUCT_CATALOGUE, delivery_calculator, offers)
    end
  end
end

