require 'bundler/setup'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |c|
  c.rspec_opts = ['--color', '--format=doc']
end

task :default => :build
