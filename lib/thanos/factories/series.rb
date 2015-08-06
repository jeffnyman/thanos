require 'thanos/mappers/series_data_mapper'
require 'thanos/resources/series'

module Thanos
  module Factory
    class Series
      def initialize(results)
        @results = results
      end

      def build
        attributes = Thanos::SeriesDataMapper.new(@results).map
        Thanos::Series.new(attributes: attributes)
      end
    end
  end
end
