# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{admin_tools_ennder}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ennder"]
  s.date = %q{2011-01-02}
  s.default_executable = %q{admin_tools_ennder}
  s.description = %q{Pages informatives de test et de développement}
  s.email = %q{mel@ennder.fr}
  s.executables = ["admin_tools_ennder"]
  s.extra_rdoc_files = ["History.txt", "bin/admin_tools_ennder", "lib/tasks/admin_tools_ennder_tasks.rake", "version.txt"]
  s.files = [".bnsignore", ".gitignore", "History.txt", "MIT-LICENSE", "README.md", "Rakefile", "app/.directory", "app/controllers/.directory", "app/controllers/admin_dev_infos_controller.rb", "app/controllers/admin_inflexions_controller.rb", "app/controllers/admin_menu_controller.rb", "app/controllers/admin_routes_infos_controller.rb", "app/controllers/admin_send_file_controller.rb", "app/controllers/admin_translations_controller.rb", "app/controllers/admin_url_infos_controller.rb", "app/controllers/application_controller.rb", "app/controllers/commands_controller.rb", "app/controllers/processus_controller.rb", "app/metal/processus_liste.rb", "app/models/command.rb", "app/views/.directory", "app/views/admin_dev_infos/index.html.erb", "app/views/admin_dev_infos/show.html.erb", "app/views/admin_inflexions/index.html.erb", "app/views/admin_menu/index.html.erb", "app/views/admin_routes_infos/index.html.erb", "app/views/admin_send_file/index.html.erb", "app/views/admin_translations/index.html.erb", "app/views/admin_url_infos/index.html.erb", "app/views/commands/index.html.erb", "app/views/commands/new.html.erb", "app/views/commands/show.html.erb", "app/views/processus/liste_refreshed.html.erb", "bin/admin_tools_ennder", "config/routes.rb", "db/migrate/20100422173622_create_commands.rb", "lib/admin_tools_ennder.rb", "lib/tasks/admin_tools_ennder_tasks.rake", "spec/admin_tools_ennder_spec.rb", "spec/spec_helper.rb", "test/admin_tools_ennder_test.rb", "test/test_admin_tools_ennder.rb", "test/test_helper.rb", "version.txt"]
  s.homepage = %q{http://www.ennder.fr}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{admin_tools_ennder}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Pages informatives de test et de développement}
  s.test_files = ["test/test_admin_tools_ennder.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 3.5.4"])
    else
      s.add_dependency(%q<bones>, [">= 3.5.4"])
    end
  else
    s.add_dependency(%q<bones>, [">= 3.5.4"])
  end
end
