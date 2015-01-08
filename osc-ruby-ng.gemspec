Gem::Specification.new do |gem|
  gem.name = "osc-ruby-ng"
  gem.version   = File.read('VERSION')

  gem.summary = "A ruby client for the OSC protocol"
  gem.description = "This OSC gem originally created by Tadayoshi Funaba has been updated for ruby 2.0/1.9/JRuby compatibility, plus mods by James Britt/Neurogami"

  gem.authors = "Colin Harris, James Britt, Neurogami"
  gem.email = "qzzzq1@gmail.com, james@neurogami.com"
  gem.homepage = "http://github.com/neurogami/osc-ruby"

  gem.has_rdoc = true

  gem.files = Dir['Rakefile', 'VERSION', 'LICENSE', 'examples/**/*', 'lib/**/*']
  gem.test_files = Dir['spec/**/*.rb']
end
