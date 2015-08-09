require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/factories/event'

module Thanos
  class EventFinder
    ATTRIBUTES = [:name, :nameStartsWith, :modifiedSince, :creators, :series,
                  :comics, :stories, :characters, :orderBy, :limit, :offset]

    ATTRIBUTES.each do |attribute|
      parameter = StringActions.parameterize(attribute.to_s)
      define_method("find_by_#{parameter}") do |attr|
        find("#{attribute}".to_sym => attr)
      end
    end

    private

    def find(attribute)
      FinderValidator.validate(attribute, ATTRIBUTES)
      response = Thanos::API::Client.new.get(:events, attribute)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Event.new(results).build
    end
  end
end
