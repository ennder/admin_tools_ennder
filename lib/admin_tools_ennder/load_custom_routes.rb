if Rails::VERSION::MAJOR < 3
	ActionController::Routing::Routes.add_configuration_file( File.join(::File.dirname(__FILE__), '..', '..', 'config', 'routes.rb') )
end
