require 'thanos/resources/image'

module Thanos
  module Factory
    class Image
      def initialize(images)
        @images = images
      end

      def build
        @images.collect do |image|
          Thanos::Image.new(image)
        end
      end
    end
  end
end
