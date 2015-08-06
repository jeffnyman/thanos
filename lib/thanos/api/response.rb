require 'json'

module Thanos
  module API
    class Response
      attr_reader :code, :status, :data

      def initialize(raw_response)
        response = JSON.parse(raw_response)
        @code = response['code'].to_i
        @status = response['status']
        @data = response['data']
      end
    end
  end
end
