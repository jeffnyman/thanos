module Thanos
  class Story
    attr_reader :title, :description, :type, :resource_uri, :thumbnail,
      :creators, :characters, :events, :series, :comics

    def initialize(args)
      @characters = args[:characters]
      @creators = args[:creators]
      @events = args[:events]
      @series = args[:series]
      @comics = args[:comics]

      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
