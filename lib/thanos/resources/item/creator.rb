module Thanos
  module Item
    class Creator
      attr_reader :name, :resource_uri, :role

      def initialize(data)
        @name = data['name']
        @resource_uri = data['resourceURI']
        @role = data['role']
      end

      def complete
        response = Thanos::API::Response.new(RestClient.get(@resource_uri))
        results = Thanos::ResponseHolder.new(response).results
        Thanos::Factory::Creator.new(results).build
      end
    end
  end
end
