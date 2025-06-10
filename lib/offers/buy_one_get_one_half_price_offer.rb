module SalesPoC
  module Offers
    class BuyOneGetOneHalfPriceOffer < BaseStrategy
      def apply(items)
        # TODO: Invoke Product#apply_discount on products relevant to the offer
      end
    end
  end
end
