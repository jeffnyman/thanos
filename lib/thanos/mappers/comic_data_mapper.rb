module Thanos
  class ComicDataMapper
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
      }
    end
  end
end
