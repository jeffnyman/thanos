module Thanos
  module Item
    class Event
      attr_reader :id, :name, :resource_uri, :type

      def initialize(data)
        @id = data['id']
        @name = data['name']
        @resource_uri = data['resourceURI']
        @type = data['type'] || nil
      end
    end
  end
end
