module Thanos
  class TextObject
    attr_reader :type, :language, :text

    def initialize(data)
      @type = data['type']
      @language = data['language']
      @text = data['text']
    end
  end
end
