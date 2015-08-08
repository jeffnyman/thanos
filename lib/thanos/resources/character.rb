module Thanos
  class Character
    attr_reader :id, :name, :description, :resource_uri, :urls, :thumbnail,
      :comics, :stories, :events, :series

    def initialize(args)
      @comics = args[:comics]
      @series = args[:series]
      @events = args[:events]
      @stories = args[:stories]
      @urls = args[:urls]
      @thumbnail = args[:thumbnail]

      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
