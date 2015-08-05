require 'thanos/version'
require 'thanos/authentication'
require 'thanos/client'

module Thanos
  class << self
    attr_accessor :authentication

    def authenticate
      self.authentication ||= Authentication.new
      yield(authentication)
    end
  end
end
