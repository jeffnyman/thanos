require 'thanos/mappers/creator_data_mapper'
require 'thanos/resources/creator'

module Thanos
  module Factory
    class Creator
      def initialize(results)
        @results = results
      end

      def build
        attributes = Thanos::CreatorDataMapper.new(@results).map
        Thanos::Creator.new(attributes: attributes)
      end
    end
  end
end
