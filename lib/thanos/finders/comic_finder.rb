require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/factories/comic'

module Thanos
  class ComicFinder
    define_method('find_by_title') do |value|
      options = { name: value }
      response = Thanos::API::Client.new.get(:comics, options)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Comic.new(results).build
    end
  end
end
