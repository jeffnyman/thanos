module Thanos
  class Url
    attr_reader :type, :url

    def initialize(data)
      @type = data['type']
      @url = data['url']
    end
  end
end
