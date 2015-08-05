require 'digest/md5'
require 'thanos/authentication'

module Thanos
  module API
    class Authentication
      class << self
        def get
          public_api_key = Thanos.authentication.public_api_key
          private_api_key = Thanos.authentication.private_api_key
          timestamp = Time.now.to_i.to_s
          hash = Digest::MD5.hexdigest(
            timestamp + private_api_key + public_api_key)
          { ts: timestamp, apikey: public_api_key, hash: hash }
        end
      end
    end
  end
end
