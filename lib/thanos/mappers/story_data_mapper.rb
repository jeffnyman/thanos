module Thanos
  class StoryDataMapper
    def initialize(results)
      @results = results
    end

    def map
      {
        title: @results['title'],
        description: @results['description'],
        type: @results['type'],
      }
    end
  end
end
