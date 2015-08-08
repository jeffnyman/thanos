require 'thanos/resources/item/comic'

module Thanos
  module Factory
    module Item
      class Comic
        def initialize(results)
          @results = results
        end

        def build
          @results.collect do |comic|
            Thanos::Item::Comic.new(comic)
          end
        end
      end
    end
  end
end
