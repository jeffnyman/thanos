require 'thanos/resources/url'

module Thanos
  module Factory
    class Url
      def initialize(urls)
        @urls = urls
      end

      def build
        @urls.collect do |url|
          Thanos::Url.new(url)
        end
      end
    end
  end
end
