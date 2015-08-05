require 'rest_client'
require 'thanos/api/response'
require 'thanos/api/authentication'

module Thanos
  module API
    class Client
      API_VERSION = 'v1'
      API_ENDPOINT = 'http://gateway.marvel.com'

      def get(resource, options)
        url = "#{endpoint}/#{resource}"
        response = RestClient.get(url, params: options.merge(authentication))
        Thanos::API::Response.new(response)
      end

      def endpoint
        "#{API_ENDPOINT}/#{API_VERSION}/public"
      end

      def authentication
        Authentication.get
      end
    end
  end
end
