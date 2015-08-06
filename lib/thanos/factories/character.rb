require 'thanos/resources/character'
require 'thanos/mappers/character_data_mapper'

module Thanos
  module Factory
    class Character
      def initialize(results)
        @results = results
      end

      def build
        attributes = Thanos::CharacterDataMapper.new(@results).map
        Thanos::Character.new(attributes: attributes)
      end
    end
  end
end
