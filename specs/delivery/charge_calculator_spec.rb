require "delivery/charge_calculator"

RSpec.describe SalesPoC::Delivery::ChargeCalculator do
  subject { described_class.new(rules) }

  let(:rules) do
    [
      { min: 0, max: 50, charge: 4.95 },
      { min: 50, max: 90, charge: 2.95 },
      { min: 90, max: Float::INFINITY, charge: 0 }
    ]
  end

  describe "#calculate" do
    it "returns 0 when the subtotal is zero" do
      expect(subject.calculate(0)).to eq 0
    end

    it "returns 4.95 for orders below $50" do
      expect(subject.calculate(0.1)).to eq 4.95
      expect(subject.calculate(49.99)).to eq 4.95
    end

    it "returns 2.95 for orders of $50 and below $90" do
      expect(subject.calculate(50)).to eq 2.95
      expect(subject.calculate(89.99)).to eq 2.95
    end

    it "returns 0 for orders of $90 and above" do
      expect(subject.calculate(90)).to eq 0
      expect(subject.calculate(1000)).to eq 0
    end
  end
end
