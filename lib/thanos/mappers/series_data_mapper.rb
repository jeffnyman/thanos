require 'thanos/mappers/mappable'

module Thanos
  class SeriesDataMapper
    include Thanos::Mappable

    def initialize(results)
      @results = results
    end

    def map
      {
        id: @results['id'],
        title: @results['title'],
        description: @results['description'],
        resource_uri: @results['resourceURI'],
        start_year: @results['startYear'],
        end_year: @results['endYear'],
        rating: @results['rating'],
        type: @results['type'],
        urls: urls,
        thumbnail: thumbnail,
        comics: comics,
        stories: stories,
        events: events,
        creators: creators,
        characters: characters,
      }
    end
  end
end
