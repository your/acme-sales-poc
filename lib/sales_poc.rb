module SalesPoC
  require "offers"
  require "delivery/charge_calculator"
  require "product"
  require "basket"

  require "seeds/delivery_rules"
  require "seeds/product_catalogue"

  class << self
    def new_basket
      offers = [Offers::BuyOneGetOneHalfPriceOffer.new("R01")]
      delivery_calculator = Delivery::ChargeCalculator.new(DELIVERY_RULES)

      Basket.new(PRODUCT_CATALOGUE, delivery_calculator, offers)
    end
  end
end

