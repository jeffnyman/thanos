require 'thanos/response_holder'
require 'thanos/api/client'
require 'thanos/factories/character'

module Thanos
  class CharacterFinder
    define_method('find_by_name') do |value|
      options = { name: value }
      response = Thanos::API::Client.new.get(:characters, options)
      Thanos::ResponseHolder.new(response)
      Thanos::Factory::Character.new.build
    end
  end
end
