require 'thanos/mappers/mappable'

module Thanos
  class StoryDataMapper
    include Thanos::Mappable

    def initialize(results)
      @results = results
    end

    def map
      {
        title: @results['title'],
        description: @results['description'],
        type: @results['type'],
        resource_uri: @results['resourceURI'],
        characters: characters,
        creators: creators,
        events: events,
        series: series,
        comics: comics,
      }
    end
  end
end
