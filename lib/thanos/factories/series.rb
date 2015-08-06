require 'thanos/resources/series'

module Thanos
  module Factory
    class Series
      def initialize(results)
        @results = results
      end

      def build
        Thanos::Series.new
      end
    end
  end
end
