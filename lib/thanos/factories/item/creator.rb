require 'thanos/resources/item/creator'

module Thanos
  module Factory
    module Item
      class Creator
        def initialize(results)
          @results = results
        end

        def build
          @results.collect do |comic|
            Thanos::Item::Creator.new(comic)
          end
        end
      end
    end
  end
end
