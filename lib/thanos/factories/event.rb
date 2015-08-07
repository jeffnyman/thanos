require 'thanos/resources/event'

module Thanos
  module Factory
    class Event
      def initialize(results)
        @results = results
      end

      def build
        Thanos::Event.new
      end
    end
  end
end
