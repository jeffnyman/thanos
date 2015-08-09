module Thanos
  class Event
    attr_reader :id, :title, :description, :resource_uri, :start, :end,
      :urls, :thumbnail, :series, :stories, :events, :comics, :characters,
      :creators

    def initialize(args)
      @creators = args[:creators]
      @characters = args[:characters]
      @series = args[:series]
      @stories = args[:stories]
      @events = args[:events]
      @comics = args[:comics]
      @urls   = args[:urls]
      @thumbnail = args[:thumbnail]
      @start = args[:start]
      @end = args[:_end]

      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
