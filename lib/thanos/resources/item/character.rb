module Thanos
  module Item
    class Character
      attr_reader :id, :name, :resource_uri, :type

      def initialize(data)
        @id = data['id'].to_i
        @name = data['name']
        @resource_uri = data['resourceURI']
        @type = data['type'] || nil
      end
    end
  end
end
