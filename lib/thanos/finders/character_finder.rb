require 'thanos/factories/character'

module Thanos
  class CharacterFinder
    define_method('find_by_name') do |_value|
      Thanos::Factory::Character.new.build
    end
  end
end
