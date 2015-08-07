module Thanos
  class Story
    attr_reader :title, :description, :type

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
