module Thanos
  class Thumbnail
    attr_reader :path, :extension, :full_path

    def initialize(data)
      @path = data['path']
      @extension = data['extension']
      @full_path = @path + '.' + @extension
    end
  end
end
