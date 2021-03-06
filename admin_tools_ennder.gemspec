Gem::Specification.new do |s|
  s.name        = 'admin_tools_ennder'
  s.version     = '1.3.20'
  s.date        = '2018-09-13'
  s.summary     = "Outil en français pour examiner le coeur d'une application Rails (Tool in French to examine Rails application internals)"
  s.description = "Liste des Inflections, Traductions, Routes, Gems, Processus server, Informations de Développement, Url courante + execution de commandes shell + helpers de téléchargement de fichier"
  s.authors     = ["Ennder"]
  s.email       = 'mel+rails@ennder.fr'

  s.files       = [
    'Changelog',
    'MIT-LICENSE',
    'README.md',
    'Rakefile', # Add tests
    'TODO',
  ]
  s.files += Dir['app/**/*']
  s.files += Dir['config/**/*']
  s.files += Dir['db/**/*']
  s.files += Dir['lib/**/*']
  s.files += Dir['test/**/*']

  s.homepage    = 'https://github.com/ennder/admin_tools_ennder'
  s.license     = 'MIT'
end
