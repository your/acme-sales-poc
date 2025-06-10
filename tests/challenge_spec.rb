require "challenge"

RSpec.describe "basket interface" do
  it do
    delivery_rules = [
      { min: 0, max: 50, charge: 4.95 },
      { min: 50, max: 90, charge: 2.95 },
      { min: 90, max: Float::INFINITY, charge: 0 }
    ]

    catalogue = [
      Product.new("R01", "Red Widget", 32.95),
      Product.new("G01", "Green Widget", 24.95),
      Product.new("B01", "Blue Widget", 7.95)
    ]

    red_widget_offer = BuyOneGetOneHalfPriceOffer.new("R01")
    delivery_calculator = DeliveryChargeCalculator.new(delivery_rules)
    basket = Basket.new(catalogue, delivery_calculator, [red_widget_offer])

    basket.add("R01")
    basket.add("R01")

    expect(basket.total).to eq(0)
  end
end
