#! /usr/bin/env ruby

require 'yaml'
require 'net/http'
require 'digest/md5'

# http://developer.marvel.com/documentation/authorization
# Requests on the server side must be of the form:
# http://gateway.marvel.com/v1/comics/?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150

# `ts` is a timestamp, but it can apparently just be some string which can
#  change on a request-by-request basis.
# `apikey` is the public API key
# `hash` is an md5 digest of the timestamp parameter, the private key and
#  the public key.

# This test file requires an api_key.yml file with the following:
# public_api_key: value
# private_api_key: value
# This file will not be placed in version control since it will contain the
# private key.

api_key_file = "#{File.dirname(__FILE__)}/api_keys.yml"

marvel_public_key = YAML.load_file(api_key_file)['public_api_key']
marvel_private_key = YAML.load_file(api_key_file)['private_api_key']

endpoint = 'http://gateway.marvel.com/v1/public/'

timestamp = '1'

ts_param = '&ts='
hash_param = '&hash='
api_param = '&apikey='

search_term = 'characters?name=Spider-Man'

url = endpoint + search_term + ts_param + timestamp + api_param + marvel_public_key + hash_param

hash = timestamp + marvel_private_key + marvel_public_key
digest = Digest::MD5.hexdigest(hash)

url += digest

puts url

response = Net::HTTP.get_response(URI.parse(url))
response_text = response.body

puts response_text
