require 'thanos/resources/text_object'

module Thanos
  module Factory
    class TextObject
      def initialize(text_objects)
        @text_objects = text_objects
      end

      def build
        @text_objects.collect do |text_object|
          Thanos::TextObject.new(text_object)
        end
      end
    end
  end
end
