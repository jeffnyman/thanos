module Thanos
  module Item
    class Creator
      attr_reader :name, :resource_uri, :role

      def initialize(data)
        @name = data['name']
        @resource_uri = data['resourceURI']
        @role = data['role']
      end
    end
  end
end
