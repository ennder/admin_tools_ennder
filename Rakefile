
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name        'admin_tools_ennder'
  authors     'Ennder'
  email       'mel@ennder.fr'
  url         'https://github.com/Utopism/admin_tools_ennder'
  summary     'Tools to examine applications'
  description 'Tools to examine application : Lists of Inflections, Translations, Routes, Gems, Server processes, Development informations, Current Url, Shell command execution, File upload'
  #development_dependency '~> 3.8', '>= 3.8.3'
  #licenses    ['AGPL-3.0']
}

