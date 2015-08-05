$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  coverage_dir "#{SimpleCov.root}/spec/reports/coverage"
  minimum_coverage 90
  maximum_coverage_drop 5
end

require 'thanos'
require 'webmock'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.disable_monkey_patching!

  config.warnings = false

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random

  # config.profile_examples = 10
  # Kernel.srand config.seed
end

RSpec.configure do
  include WebMock::API

  def stub_get(path)
    stub_request(:get, path)
  end

  def fixture(file)
    File.new(fixture_path + '/' + file)
  end

  def fixture_path
    File.expand_path('../fixtures', __FILE__)
  end
end
