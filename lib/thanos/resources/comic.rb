module Thanos
  class Comic
    attr_reader :id, :title, :description, :format, :resource_uri

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
