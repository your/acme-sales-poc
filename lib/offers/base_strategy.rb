module SalesPoC
  module Offers
    class BaseStrategy
      def apply(items)
        raise NotImplementedError
      end
    end
  end
end
