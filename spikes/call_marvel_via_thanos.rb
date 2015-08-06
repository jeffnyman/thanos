#! /usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'yaml'
require 'thanos'

api_key_file = "#{File.dirname(__FILE__)}/api_keys.yml"

public_key = YAML.load_file(api_key_file)['public_api_key']
private_key = YAML.load_file(api_key_file)['private_api_key']

Thanos.authenticate do |key|
  key.public_api_key = public_key
  key.private_api_key = private_key
end

client = Thanos::Client.new

hulk = client.characters.find_by_name 'Hulk'
puts hulk.id
puts hulk.name
puts hulk.description
puts hulk.resource_uri
puts hulk.urls.first.url
puts hulk.thumbnail.full_path

avengers = client.series.find_by_name 'The Avengers'
