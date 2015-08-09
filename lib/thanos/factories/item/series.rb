require 'thanos/resources/item/series'

module Thanos
  module Factory
    module Item
      class Series
        def initialize(results)
          @results = results
        end

        def build
          if @results.is_a?(Array)
            @results.collect do |comic|
              Thanos::Item::Series.new(comic)
            end
          else
            [Thanos::Item::Series.new(@results)]
          end
        end
      end
    end
  end
end
