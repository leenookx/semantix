# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

require 'rubygems'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

# task features
Cucumber::Rake::Task.new do |task|
    task.cucumber_opts = "--format pretty"
end

