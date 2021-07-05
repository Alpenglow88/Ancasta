# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: [:spec]
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--pattern spec/*_spec.rb'
end

RSpec::Core::RakeTask.new(:singleSpec, :specName) do |t, task_args|
  t.rspec_opts = "--pattern spec/#{task_args[:specName]}_spec.rb"
end
