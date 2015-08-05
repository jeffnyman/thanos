# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thanos/version'

Gem::Specification.new do |spec|
  spec.name          = 'thanos'
  spec.version       = Thanos::VERSION
  spec.authors       = ['Jeff Nyman']
  spec.email         = ['jeffnyman@gmail.com']

  spec.summary       = 'Marvel Comics API Entity Wrapper'
  spec.description   = '
    The Thanos gem allows you to consume the API provided by the Marvel
    development team, querying on various aspects of the entire Marvel
    universe.'
  spec.homepage      = 'https://github.com/jnyman/thanos'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'

  spec.post_install_message = %{
(::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)

  Thanos #{Thanos::VERSION} has been installed.

(::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)
  }
end
