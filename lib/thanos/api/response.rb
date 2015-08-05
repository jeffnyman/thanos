require 'json'

module Thanos
  module API
    class Response
      attr_reader :data

      def initialize(raw_response)
        response = JSON.parse(raw_response)
        @data = response['data']
      end
    end
  end
end
