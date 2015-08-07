module Thanos
  class Event
    attr_reader :id, :title, :description, :resource_uri, :start, :end,
      :urls, :thumbnail

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
