require 'thanos/mappers/mappable'

module Thanos
  class EventDataMapper
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
        start: start_date,
        end: end_date,
        urls: urls,
        thumbnail: thumbnail,
      }
    end
  end
end
