require 'thanos/mappers/mappable'

module Thanos
  class CreatorDataMapper
    include Thanos::Mappable

    def initialize(results)
      @results = results
    end

    def map
      {
        id: @results['id'],
        first_name: @results['firstName'],
        middle_name: @results['middleName'],
        last_name: @results['lastName'],
        suffix: @results['suffix'],
        full_name: @results['fullName'],
        description: @results['description'],
        resource_uri: @results['resourceURI'],
        urls: urls,
        thumbnail: thumbnail,
        series: series,
        stories: stories,
        comics: comics,
        events: events,
      }
    end
  end
end
