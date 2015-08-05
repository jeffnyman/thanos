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
