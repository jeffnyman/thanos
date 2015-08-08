module Thanos
  module Item
    class Story
      attr_reader :name, :resource_uri, :type

      def initialize(data)
        @name = data['name']
        @resource_uri = data['resourceURI']
        @type = data['type']
      end
    end
  end
end
