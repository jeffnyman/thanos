require 'thanos/factories/url'
require 'thanos/factories/thumbnail'

require 'thanos/factories/item/comic'
require 'thanos/factories/item/story'
require 'thanos/factories/item/event'
require 'thanos/factories/item/series'

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

    def start_date
      DateTime.parse(@results['start'])
    end

    def end_date
      DateTime.parse(@results['end'])
    end

    def comics
      Thanos::Factory::Item::Comic.new(@results['comics']['items']).build
    end

    def stories
      Thanos::Factory::Item::Story.new(@results['stories']['items']).build
    end

    def events
      Thanos::Factory::Item::Event.new(@results['events']['items']).build
    end

    def series
      Thanos::Factory::Item::Series.new(@results['series']['items']).build
    end
  end
end
