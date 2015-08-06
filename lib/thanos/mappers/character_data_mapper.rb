module Thanos
  class CharacterDataMapper
    def initialize(results)
      @results = results
    end

    def map
      {
        id: @results['id'],
        name: @results['name'],
        description: @results['description'],
        resource_uri: @results['resourceURI'],
      }
    end
  end
end
