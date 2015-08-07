require 'thanos/mappers/event_data_mapper'
require 'thanos/resources/event'

module Thanos
  module Factory
    class Event
      def initialize(results)
        @results = results
      end

      def build
        attributes = Thanos::EventDataMapper.new(@results).map
        Thanos::Event.new(attributes: attributes)
      end
    end
  end
end
