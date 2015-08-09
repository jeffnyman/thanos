require 'thanos/resources/price'

module Thanos
  module Factory
    class Price
      def initialize(prices)
        @prices = prices
      end

      def build
        @prices.collect do |price|
          Thanos::Price.new(price)
        end
      end
    end
  end
end
