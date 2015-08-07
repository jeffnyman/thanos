require 'thanos/mappers/story_data_mapper'
require 'thanos/resources/story'

module Thanos
  module Factory
    class Story
      def initialize(results)
        @results = results
      end

      def build
        attributes = Thanos::StoryDataMapper.new(@results).map
        Thanos::Story.new(attributes: attributes)
      end
    end
  end
end
