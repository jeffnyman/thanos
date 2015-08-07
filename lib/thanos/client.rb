require 'thanos/finders/character_finder'
require 'thanos/finders/series_finder'
require 'thanos/finders/event_finder'
require 'thanos/finders/comic_finder'

module Thanos
  class Client
    attr_reader :characters, :series, :events, :comics

    def initialize
      @characters = Thanos::CharacterFinder.new
      @series = Thanos::SeriesFinder.new
      @events = Thanos::EventFinder.new
      @comics = Thanos::ComicFinder.new
    end
  end
end
