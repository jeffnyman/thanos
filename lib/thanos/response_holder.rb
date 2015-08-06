module Thanos
  class ResponseHolder
    attr_reader :results

    def initialize(response)
      data = response.data
      @results = data['results'].first
    end
  end
end
