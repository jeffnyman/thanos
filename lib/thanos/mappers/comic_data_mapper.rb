require 'thanos/mappers/mappable'

module Thanos
  class ComicDataMapper
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
        format: @results['format'],
        digital_id: @results['digitalId'],
        issue_number: @results['issueNumber'],
        variant_description: @results['variantDescription'],
        isbn: @results['isbn'],
        upc: @results['upc'],
        diamond_code: @results['diamondCode'],
        ean: @results['ean'],
        issn: @results['issn'],
        page_count: @results['pageCount'],
        urls: urls,
        thumbnail: thumbnail,
        stories: stories,
        events: events,
        series: series,
        creators: creators,
        characters: characters,
        prices: prices,
        dates: dates,
        images: images,
        text_objects: text_objects,
      }
    end
  end
end
