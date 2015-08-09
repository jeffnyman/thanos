module Thanos
  class Story
    attr_reader :title, :description, :type, :resource_uri, :thumbnail,
      :creators, :characters, :events, :series, :comics

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
