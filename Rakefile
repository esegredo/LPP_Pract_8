$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Run rspec for development - Class Fraction"
task :fspec do
  sh "rspec -Ilib spec/fraction_spec.rb"
end

desc "Run rspec for development - Class Matrix"
task :mspec do
  sh "rspec -Ilib spec/matrix_spec.rb"
end

desc "Run rspec with --format documentation - Class Matrix"
task :doc do
  sh "rspec -Ilib spec/matrix_spec.rb --format documentation"
end
