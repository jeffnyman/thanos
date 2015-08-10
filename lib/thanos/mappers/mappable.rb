require 'thanos/factories/url'
require 'thanos/factories/thumbnail'
require 'thanos/factories/price'
require 'thanos/factories/date'
require 'thanos/factories/image'
require 'thanos/factories/text_object'

require 'thanos/factories/item/comic'
require 'thanos/factories/item/story'
require 'thanos/factories/item/event'
require 'thanos/factories/item/series'
require 'thanos/factories/item/character'
require 'thanos/factories/item/creator'

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
      Thanos::Factory::Item::Series.new(
        @results['series']['items'] || @results['series']).build
    end

    def creators
      Thanos::Factory::Item::Creator.new(@results['creators']['items']).build
    end

    def characters
      Thanos::Factory::Item::Character.new(
        @results['characters']['items']).build
    end

    def prices
      Thanos::Factory::Price.new(@results['prices']).build
    end

    def dates
      Thanos::Factory::Date.new(@results['dates']).build
    end

    def images
      Thanos::Factory::Image.new(@results['images']).build
    end

    def text_objects
      Thanos::Factory::TextObject.new(@results['textObjects']).build
    end

    def next_event
      Thanos::Factory::Item::Event.new(@results['next']).build.first
    end

    def previous_event
      Thanos::Factory::Item::Event.new(@results['previous']).build.first
    end

    def next_series
      Thanos::Factory::Item::Series.new(@results['next']).build
    end

    def previous_series
      Thanos::Factory::Item::Series.new(@results['previous']).build
    end
  end
end
