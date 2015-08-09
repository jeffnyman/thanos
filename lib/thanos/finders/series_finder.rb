require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/factories/series'

module Thanos
  class SeriesFinder
    ATTRIBUTES = [:name, :modifiedSince, :creators, :characters, :series,
                  :comics, :stories, :orderBy, :limit, :offset]

    ATTRIBUTES.each do |attribute|
      parameter = StringActions.parameterize(attribute.to_s)
      define_method("find_by_#{parameter}") do |attr|
        find("#{attribute}".to_sym => attr)
      end
    end

    def find(attribute)
      FinderValidator.validate(attribute, ATTRIBUTES)
      response = Thanos::API::Client.new.get(:series, attribute)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Series.new(results).build
    end
  end
end
