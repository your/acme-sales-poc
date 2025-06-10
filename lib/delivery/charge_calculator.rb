module SalesPoC
  module Delivery
    class ChargeCalculator
      def initialize(rules)
        @rules = rules
      end

      def calculate(subtotal)
        # TODO: apply rules
        return 0.round(2)
      end
    end
  end
end
