module Thanos
  module Item
    class Event
      attr_reader :id, :name, :resource_uri, :type

      def initialize(data)
        @id = data['id'].to_i
        @name = data['name']
        @resource_uri = data['resourceURI']
        @type = data['type'] || nil
      end

      def complete
        response = Thanos::API::Response.new(RestClient.get(@resource_uri))
        results = Thanos::ResponseHolder.new(response).results
        Thanos::Factory::Event.new(results).build
      end
    end
  end
end
