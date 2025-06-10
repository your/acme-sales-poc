require "sales_poc"

RSpec.describe SalesPoC do
  describe ".new_basket" do
    subject { described_class.new_basket }

    it { is_expected.to be_a described_class::Basket}
  end
end
