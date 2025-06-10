require "product"

RSpec.describe SalesPoC::Product do
  subject(:product) { described_class.new("P0", "Test Product", base_price) }
  let(:base_price) { 99.9 }

  describe "#apply_discount" do
    it "sets a % discount calculated on the base price" do
      expect { product.apply_discount(0.5) }
        .to change { product.discount }
        .to(base_price/2)
    end
  end

  describe "#final_price" do
    subject { product.final_price }

    it "returns the base price when there is no discount" do
      is_expected.to eq base_price
    end

    it "returns the base price minus the discount when present" do
      product.apply_discount(0.1)
      discount = 9.99

      is_expected.to eq 89.91
    end
  end
end
