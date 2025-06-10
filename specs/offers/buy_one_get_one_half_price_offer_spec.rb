require "offers"
require "product"

RSpec.describe SalesPoC::Offers::BuyOneGetOneHalfPriceOffer do
  subject(:offer) { described_class.new(product_code).apply(items) }

  let(:product_code) { "P1" }
  let(:items) do
    [
      SalesPoC::Product.new("P1", "Product 1", 9.90),
      SalesPoC::Product.new("P1", "Product 1", 9.90),
      SalesPoC::Product.new("P1", "Product 1", 9.90),
      SalesPoC::Product.new("P2", "Product 2", 15.49),
      SalesPoC::Product.new("P2", "Product 2", 15.49),
    ]
  end

  it "applies a 50% discount on the second item with a given product code" do
    expect { offer }
      .to change { items.map { |item| [item.code, item.discount]} }
      .to([
        ["P1", 0],
        ["P1", 4.95],
        ["P1", 0],
        ["P2", 0],
        ["P2", 0]
      ])
  end
end
