#! /usr/bin/env ruby
# encoding: utf-8

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => :test
task :test => :spec

desc "Run RSpec specs"
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = '--color --format progress'
  task.fail_on_error = false
end
