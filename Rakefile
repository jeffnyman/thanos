require 'bundler/gem_tasks'
require 'rdoc/task'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.main = 'README.md'
  rdoc.title = "Thanos #{Thanos::VERSION}"
  rdoc.rdoc_files.include('README*', 'lib/**/*.rb')
end

task default: [:spec, :rubocop]
