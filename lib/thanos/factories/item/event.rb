require 'thanos/resources/item/event'

module Thanos
  module Factory
    module Item
      class Event
        def initialize(results)
          @results = results
        end

        def build
          @results.collect do |comic|
            Thanos::Item::Event.new(comic)
          end
        end
      end
    end
  end
end
