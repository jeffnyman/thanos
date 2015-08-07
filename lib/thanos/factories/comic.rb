require 'thanos/resources/comic'

module Thanos
  module Factory
    class Comic
      def initialize(results)
        @results = results
      end

      def build
        Thanos::Comic.new
      end
    end
  end
end
