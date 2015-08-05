module Thanos
  class ResponseHolder
    attr_reader :results

    def initialize(response)
      data = response.data

      @results = data['results']
    end
  end
end
