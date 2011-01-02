
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name  'admin_tools_ennder'
  authors  'Ennder'
  email    'mel@ennder.fr'
  url      'www.ennder.fr'
}

