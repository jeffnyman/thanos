module Thanos
  class Series
    attr_reader :id, :title, :description, :resource_uri, :start_year,
      :end_year, :rating, :type, :urls, :thumbnail, :comics, :stories,
      :events, :creators, :characters

    def initialize(args)
      @stories = args[:stories]
      @events = args[:events]
      @creators = args[:creators]
      @characters = args[:characters]
      @comics = args[:comics]
      @urls = args[:urls]
      @thumbnail = args[:thumbnail]

      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
