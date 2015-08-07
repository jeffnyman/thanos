require 'thanos/api/client'
require 'thanos/response_holder'
require 'thanos/factories/story'

module Thanos
  class StoryFinder
    define_method('find_by_comics') do |value|
      options = { name: value }
      response = Thanos::API::Client.new.get(:stories, options)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Story.new(results).build
    end
  end
end
