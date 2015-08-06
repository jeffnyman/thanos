require 'thanos/finders/character_finder'
require 'thanos/finders/series_finder'

module Thanos
  class Client
    attr_reader :characters, :series

    def initialize
      @characters = Thanos::CharacterFinder.new
      @series = Thanos::SeriesFinder.new
    end
  end
end
