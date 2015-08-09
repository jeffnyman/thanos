require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/string_actions'
require 'thanos/factories/comic'
require 'thanos/finders/finder_validator'

module Thanos
  class ComicFinder
    ATTRIBUTES = [:title, :titleStarsWith, :format, :formatType, :upc, :isbn,
                  :issn, :ean, :noVariants, :digitalId, :hasDigitalIssue,
                  :issueNumber, :dateDescriptor, :dateRange, :startYear,
                  :modifiedSince, :diamondCode, :sharedAppearances,
                  :collaborators, :creators, :characters, :series, :events,
                  :stories]

    ATTRIBUTES.each do |attribute|
      parameter = StringActions.parameterize(attribute.to_s)
      define_method("find_by_#{parameter}") do |attr|
        find("#{attribute}".to_sym => attr)
      end
    end

    def find(attribute)
      FinderValidator.validate(attribute, ATTRIBUTES)
      response = Thanos::API::Client.new.get(:comics, attribute)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Comic.new(results).build
    end
  end
end
