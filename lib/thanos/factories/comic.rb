require 'thanos/mappers/comic_data_mapper'
require 'thanos/resources/comic'

module Thanos
  module Factory
    class Comic
      def initialize(results)
        @results = results
      end

      def build
        attributes = Thanos::ComicDataMapper.new(@results).map
        Thanos::Comic.new(attributes: attributes)
      end
    end
  end
end
