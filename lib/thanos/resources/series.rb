module Thanos
  class Series
    attr_reader :id, :title, :description, :resource_uri,
      :start_year, :end_year, :rating, :type, :urls, :thumbnail

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
