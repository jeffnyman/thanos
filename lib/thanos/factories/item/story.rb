require 'thanos/resources/item/story'

module Thanos
  module Factory
    module Item
      class Story
        def initialize(results)
          @results = results
        end

        def build
          @results.collect do |comic|
            Thanos::Item::Story.new(comic)
          end
        end
      end
    end
  end
end
