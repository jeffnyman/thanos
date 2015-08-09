module Thanos
  class Date
    attr_reader :type, :date

    def initialize(data)
      @type = data['type']
      @date = ::Date.parse(data['date'])
    end
  end
end
