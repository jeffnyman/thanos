module Thanos
  module Item
    class Comic
      attr_reader :id, :name, :resource_uri

      def initialize(data)
        @id = data['id']
        @name = data['name']
        @resource_uri = data['resourceURI']
      end
    end
  end
end
