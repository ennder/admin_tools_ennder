Gem::Specification.new do |s|
  s.name        = 'admin_tools_ennder'
  s.version     = '1.3.8'

  File.open('VERSION', 'w+') { |f| f.write(s.version.to_s + "\n") }
  
  s.date        = '2016-02-10'
  s.summary     = "Tools to examine Rails application internals"
  s.description = "Tools to examine Rails application internals : Lists of Inflections, Translations, Routes, Gems, Server processes, Development informations, Current Url + Shell command execution + File upload helpers"
  s.authors     = ["Ennder"]
  s.email       = 'mel@ennder.fr'

  s.files       = [
    'Changelog',
    'MIT-LICENSE',
    'README.md',
    'Rakefile', # Add tests
    'TODO',
    'VERSION',
  ]
  s.files += Dir['app/**/*']
  s.files += Dir['config/**/*']
  s.files += Dir['db/**/*']
  s.files += Dir['lib/**/*']
  s.files += Dir['test/**/*']

  s.homepage    = 'https://github.com/ennder/admin_tools_ennder'
  s.license     = 'MIT'
end
