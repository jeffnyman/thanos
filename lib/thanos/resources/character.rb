module Thanos
  class Character
    attr_reader :id, :name, :description, :resource_uri, :urls, :thumbnail

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
