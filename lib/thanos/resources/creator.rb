module Thanos
  class Creator
    attr_reader :id, :first_name, :middle_name, :last_name, :suffix,
      :full_name, :description, :resource_uri, :urls, :thumbnail,
      :series, :stories, :comics, :events

    def initialize(args)
      args[:attributes].each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end
