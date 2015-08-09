module Thanos
  class Price
    attr_reader :type, :price

    def initialize(data)
      @type = data['type']
      @price = data['price']
    end
  end
end
