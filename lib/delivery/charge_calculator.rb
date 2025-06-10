module SalesPoC
  module Delivery
    class ChargeCalculator
      def initialize(rules)
        @rules = rules
      end

      def calculate(subtotal)
        return 0 if subtotal.zero?

        rule = @rules.find { |rule| subtotal >= rule[:min] && subtotal < rule[:max] }
        rule ? rule[:charge].to_d.round(2) : 0
      end
    end
  end
end
