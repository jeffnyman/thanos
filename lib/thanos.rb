require 'thanos/version'
require 'thanos/authentication'

module Thanos
  class << self
    attr_accessor :authentication

    def authenticate
      self.authentication ||= Authentication.new
      yield(authentication)
    end
  end
end
