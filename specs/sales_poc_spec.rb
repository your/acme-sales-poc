require "sales_poc"

RSpec.describe SalesPoC do
  describe ".new_basket" do
    subject(:basket) { described_class.new_basket }

    it { is_expected.to be_a described_class::Basket}

    expected_totals = [
      [["B01", "G01"], 37.85],
      [["R01", "R01"], 54.37],
      [["R01", "G01"], 60.85],
      [["B01", "B01", "R01", "R01", "R01"], 98.27]
    ]

    expected_totals.each do |products, total|
      it "calculates totals accurately" do
        products.each { |code| basket.add(code) }
        expect(basket.total).to eq(total)
      end
    end
  end
end
