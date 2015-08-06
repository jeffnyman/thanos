require 'thanos/resources/thumbnail'

module Thanos
  module Factory
    class Thumbnail
      def initialize(thumbnails)
        @thumbnails = thumbnails
      end

      def build
        # TODO: Determine if an array is ever possible.
        # If this is possible, I will need the following:
        # if @thumbnails.is_a?(Array)
        #   @thumbnails.collect do |thumbnail|
        #     Thanos::Thumbnail.new(thumbnail)
        #   end
        # else
        Thanos::Thumbnail.new(@thumbnails)
      end
    end
  end
end
