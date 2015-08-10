module Thanos
  module Item
    class Series
      attr_reader :name, :resource_uri

      def initialize(data)
        @name = data['name']
        @resource_uri = data['resourceURI']
      end

      def complete
        response = Thanos::API::Response.new(RestClient.get(@resource_uri))
        results = Thanos::ResponseHolder.new(response).results
        Thanos::Factory::Series.new(results).build
      end
    end
  end
end
