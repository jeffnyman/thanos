module Thanos
  module Item
    class Series
      attr_reader :name, :resource_uri

      def initialize(data)
        @name = data['name']
        @resource_uri = data['resourceURI']
      end
    end
  end
end
