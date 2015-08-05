require 'thanos/response_holder'
require 'thanos/api/client'
require 'thanos/factories/character'

module Thanos
  class CharacterFinder
    define_method('find_by_name') do |value|
      options = { name: value }
      response = Thanos::API::Client.new.get(:characters, options)
      results = Thanos::ResponseHolder.new(response).results
      Thanos::Factory::Character.new(results).build
    end
  end
end
