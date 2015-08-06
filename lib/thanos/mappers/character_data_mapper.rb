module Thanos
  class CharacterDataMapper
    def initialize(results)
      @results = results
    end

    def map
      {
        name: @results['name'],
      }
    end
  end
end
