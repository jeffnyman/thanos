module Thanos
  class Image
    attr_reader :full_path

    def initialize(data)
      @full_path = data['path'] + '.' + data['extension']
    end
  end
end
