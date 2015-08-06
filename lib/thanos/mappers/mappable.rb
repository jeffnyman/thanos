require 'thanos/factories/url'
require 'thanos/factories/thumbnail'

module Thanos
  module Mappable
    private

    def urls
      Thanos::Factory::Url.new(@results['urls']).build
    end

    def thumbnail
      # TODO: Determine if I should just create the resource thumbnail directly.
      # The rationale is that thumbnails may never have more than one
      # entry, in which case using the factory to build a collection is
      # not necessary.
      # Thanos::Thumbnail.new(@results['thumbnail']) if @results['thumbnail']

      return unless @results['thumbnail']
      Thanos::Factory::Thumbnail.new(@results['thumbnail']).build
    end
  end
end
