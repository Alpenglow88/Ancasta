# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: [:test]

RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = '--pattern spec/*_spec.rb'
end

task :build do
  ruby './scripts/test.rb'
end

RSpec::Core::RakeTask.new(:singleSpec, :specName) do |t, task_args|
  t.rspec_opts = "--pattern spec/#{task_args[:specName]}_spec.rb"
end
