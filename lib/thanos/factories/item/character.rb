require 'thanos/resources/item/character'

module Thanos
  module Factory
    module Item
      class Character
        def initialize(results)
          @results = results
        end

        def build
          @results.collect do |character|
            Thanos::Item::Character.new(character)
          end
        end
      end
    end
  end
end
