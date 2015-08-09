require 'thanos/resources/date'

module Thanos
  module Factory
    class Date
      def initialize(dates)
        @dates = dates
      end

      def build
        @dates.collect do |date|
          Thanos::Date.new(date)
        end
      end
    end
  end
end
