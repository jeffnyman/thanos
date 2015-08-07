require 'thanos/resources/story'

module Thanos
  module Factory
    class Story
      def initialize(results)
        @results = results
      end

      def build
        Thanos::Story.new
      end
    end
  end
end
