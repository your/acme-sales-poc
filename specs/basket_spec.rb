require "basket"
require "product"

RSpec.describe SalesPoC::Basket do
  subject(:basket) { described_class.new(catalogue, delivery_calculator, offers) }

  let(:catalogue) do
    [
      SalesPoC::Product.new("P1", "Product 1", 10.99),
      SalesPoC::Product.new("P2", "Product 2", 0.99),
    ]
  end
  let(:delivery_calculator) { nil }
  let(:offers) { [] }

  describe "#add" do
    it "adds an instance of a product when the product code exists" do
      expect { basket.add("P1") }.to change { basket.items.count }.from(0).to(1)
      expect { basket.add("P2") }.to change { basket.items.count }.from(1).to(2)

      expect(basket.items).to all(be_an(SalesPoC::Product))
      expect(basket.items.map(&:code)).to match(["P1", "P2"])
    end

    it "does nothing when the product code does not exist" do
      expect { basket.add("P3") }.not_to change(basket.items, :count)
    end
  end

  describe "#total" do
    let(:delivery_charge) { 4.99 }
    let(:delivery_calculator) { double(calculate: delivery_charge) }

    it "calculates the total including any discount and delivery charge" do
      basket.add("P1")
      basket.add("P2")
      subtotal = 10.99 + 0.99

      expect(basket.total).to eq(subtotal + delivery_charge)
    end
  end
end
