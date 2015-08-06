require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/factories/series'

module Thanos
  class SeriesFinder
    define_method('find_by_name') do |value|
      options = { name: value }
      response = Thanos::API::Client.new.get(:series, options)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Series.new(results).build
    end
  end
end
