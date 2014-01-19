# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "rubySC"
  gem.homepage = "http://github.com/simdax/rubySC"
  gem.license = "MIT"
  gem.summary = %Q{simple and light music livecoding library}
  gem.description = %Q{Petite bibliotheque permettant une communication simple entre SuperCollider/JITlib et Ruby. Se concentre avant tout sur les capacités logiques de création de mélodies plus que sur la génération de son. Nécessite d'installer supercollider sur l'ordinateur (=> sudo aptitude install supercollider sur debian par exemple)"}
  gem.email = "simoncornaz@gmail.com"
  gem.authors = ["simdax"]
  # dependencies defined in Gemfile
  gem.add_dependency 'osc-ruby', '>=0'
gem.add_dependency 'active_support', '>=0'
  gem.files = Dir.glob('lib/*')

end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end


task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rubySC #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

