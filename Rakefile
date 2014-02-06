require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
end

desc "Run tests."
task default: :test

task :console do
  require 'irb'
  require 'irb/completion'
  require 'rudge'
  ARGV.clear
  IRB.start
end
