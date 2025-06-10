module SalesPoC
  module Offers
    class BaseStrategy
      attr_reader :product_code

      def initialize(product_code)
        @product_code = product_code
      end

      def apply(items)
        raise NotImplementedError
      end
    end
  end
end
