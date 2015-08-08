require 'thanos/resources/item/series'

module Thanos
  module Factory
    module Item
      class Series
        def initialize(results)
          @results = results
        end

        def build
          @results.collect do |comic|
            Thanos::Item::Series.new(comic)
          end
        end
      end
    end
  end
end
