require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/factories/story'

module Thanos
  class StoryFinder
    ATTRIBUTES = [:modifiedSince, :comics, :series, :events, :creators,
                  :characters]

    ATTRIBUTES.each do |attribute|
      parameter = StringActions.parameterize(attribute.to_s)
      define_method("find_by_#{parameter}") do |attr|
        find("#{attribute}".to_sym => attr)
      end
    end

    def find(attribute)
      FinderValidator.validate(attribute, ATTRIBUTES)
      response = Thanos::API::Client.new.get(:stories, attribute)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Story.new(results).build
    end
  end
end
