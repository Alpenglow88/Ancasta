# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: [:test]

desc 'Run tests'
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = '--pattern spec/*_spec.rb'
end

desc 'Build the tests from data sets'
task :build do
  ruby './scripts/build.rb'
end

desc 'Run single spec of tests'
RSpec::Core::RakeTask.new(:singleSpec, :specName) do |t, task_args|
  t.rspec_opts = "--pattern spec/#{task_args[:specName]}_spec.rb"
end
