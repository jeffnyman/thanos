require 'thanos/resources/item/event'

module Thanos
  module Factory
    module Item
      class Event
        def initialize(results)
          @results = results
        end

        def build
          if @results.is_a?(Array)
            @results.collect do |comic|
              Thanos::Item::Event.new(comic)
            end
          else
            [Thanos::Item::Event.new(@results)]
          end
        end
      end
    end
  end
end
