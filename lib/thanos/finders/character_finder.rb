require 'thanos/response_holder'
require 'thanos/string_actions'
require 'thanos/api/client'
require 'thanos/factories/character'
require 'thanos/finders/finder_validator'

module Thanos
  class CharacterFinder
    ATTRIBUTES = [:name, :comics, :series, :events, :series,
                  :nameStartsWith, :modifiedSince]

    ATTRIBUTES.each do |attribute|
      parameter = StringActions.parameterize(attribute.to_s)
      define_method("find_by_#{parameter}") do |attr|
        find("#{attribute}".to_sym => attr)
      end
    end

    private

    def find(attribute)
      FinderValidator.validate(attribute, ATTRIBUTES)
      response = Thanos::API::Client.new.get(:characters, attribute)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Character.new(results).build
    end
  end
end
