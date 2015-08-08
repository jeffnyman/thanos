require 'thanos/mappers/mappable'

module Thanos
  class CharacterDataMapper
    include Thanos::Mappable

    def initialize(results)
      @results = results
    end

    def map
      {
        id: @results['id'],
        name: @results['name'],
        description: @results['description'],
        resource_uri: @results['resourceURI'],
        urls: urls,
        thumbnail: thumbnail,
        comics: comics,
        stories: stories,
        events: events,
        series: series,
      }
    end
  end
end
