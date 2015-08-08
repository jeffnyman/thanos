require 'thanos/response_holder'
require 'thanos/api/client'
require 'thanos/factories/character'

module Thanos
  class CharacterFinder
    ATTRIBUTES = [:name]

    ATTRIBUTES.each do |attribute|
      define_method("find_by_#{attribute}") do |attr|
        find("#{attribute}".to_sym => attr)
      end
    end

    private

    def find(attribute)
      response = Thanos::API::Client.new.get(:characters, attribute)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Character.new(results).build
    end
  end
end
