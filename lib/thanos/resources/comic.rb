module Thanos
  class Comic
    attr_reader :id, :title, :description, :format, :resource_uri,
      :issue_number, :ean, :isbn, :upc, :issn, :page_count,
      :digital_id, :diamond_code, :variant_description, :dates,
      :urls, :thumbnail, :text_objects, :images, :prices,
      :stories, :creators, :series, :events, :characters

    def initialize(args)
      @series = args[:series]
      @stories = args[:stories]
      @creators = args[:creators]
      @events = args[:events]
      @characters = args[:characters]
      @urls = args[:urls]
      @prices = args[:prices]
      @images = args[:images]
      @thumbnail = args[:thumbnail]
      @text_objects = args[:text_objects]
      @dates = args[:dates]

      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
