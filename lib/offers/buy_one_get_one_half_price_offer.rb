require "bigdecimal/util"

module SalesPoC
  module Offers
    class BuyOneGetOneHalfPriceOffer < BaseStrategy
      HALF_PRICE_DISCOUNT = 0.5.to_d

      def apply(items)
        matching_items = items.select { |item| item.code == product_code }
        return if matching_items.length < 2

        matching_items.each_slice(2) do |first, second|
          second.apply_discount(HALF_PRICE_DISCOUNT) if second
        end
      end
    end
  end
end
