# -*- coding: utf-8 -*-
if Rails::VERSION::MAJOR >= 3
	begin
#		puts "Engine admin_tools_ennder, config/routes.rb : [#{Rails.application.routes.routes.size}] route(s)"

		_routes = Rails.application.routes
		_routes.draw do
			resources :commands do
				member do
					get 'execute'
				end
			end

			#Le menu
			match 'admin/menu'					=> 'admin_menu#index'

			#Les outils
			match 'admin/inflexions'			=> 'admin_inflexions#index'
			match 'admin/translations'			=> 'admin_translations#index'
			match 'admin/routes'				=> 'admin_routes#index'
			match 'admin/gems'					=> 'admin_gems#index'
			match 'admin/dev_infos'				=> 'admin_dev_infos#index'
			match 'admin/url_infos'				=> 'admin_url_infos#index'
			match 'admin/commands'				=> 'commands#index'
			match 'admin/send_file'				=> 'admin_send_file#index'
			match 'admin/processus_liste'		=> 'processus#index'
		end

		puts "Engine admin_tools_ennder, Rails 3, config/routes.rb : [#{_routes.routes.size}] route(s)"
	rescue
		puts "Engine admin_tools_ennder, Rails 3, config/routes.rb : exception : #{$!}"
	end
else
	#Pour Rails 2
	ActionController::Routing::Routes.draw do |map|
		map.resources :commands, :member => { :execute => :get }

		#Le menu
		map.admin_menu			'/admin/menu', :controller => 'admin_menu'

		#Les outils
		map.admin_inflexions	'/admin/inflexions',	:controller => 'admin_inflexions'
		map.admin_translations	'/admin/translations',	:controller => 'admin_translations'
		map.admin_routes		'/admin/routes',		:controller => 'admin_routes'
		map.admin_gems			'/admin/gems',			:controller => 'admin_gems'

		map.admin_dev_infos		'/admin/dev_infos',		:controller => 'admin_dev_infos'
		map.admin_url_infos		'/admin/url_infos',		:controller => 'admin_url_infos'

		map.admin_commands		'/admin/commands',		:controller => 'commands'
		map.admin_send_file		'/admin/send_file',		:controller => 'admin_send_file'
		map.admin_processus_liste	'/admin/processus_liste',		:controller => 'processus'
	end
	puts "Engine admin_tools_ennder, Rails 2, config/routes.rb : [#{ActionController::Routing::Routes.routes.size}] route(s)"
end
