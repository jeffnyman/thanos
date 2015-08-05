require 'thanos/resources/character'

module Thanos
  module Factory
    class Character
      def build
        Thanos::Character.new
      end
    end
  end
end
