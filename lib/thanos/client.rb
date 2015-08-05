require 'thanos/finders/character_finder'

module Thanos
  class Client
    attr_reader :characters

    def initialize
      @characters = Thanos::CharacterFinder.new
    end
  end
end
