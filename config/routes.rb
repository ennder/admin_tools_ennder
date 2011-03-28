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
			match 'admin_menu'					=> 'admin_menu#index'

			#Les outils
			match 'admin/inflexions'			=> 'admin_inflexions#index'
			match 'admin/translations'			=> 'admin_translations#index'
			match 'admin/routes'				=> 'admin_routes#index'
			match 'admin/gems	'				=> 'admin_gems#index'
			match 'admin/dev_infos'				=> 'admin_dev_infos#index'
			match 'admin/url_infos'				=> 'admin_url_infos#index'
			match 'admin/commands'				=> 'commands#index'
			match 'admin/send_file'				=> 'admin_send_file#index'
		end

		puts "Engine admin_tools_ennder, config/routes.rb : [#{_routes.routes.size}] route(s)"
	rescue
		puts "Engine admin_tools_ennder, config/routes.rb : exception : #{$!}"
	end
else
	#Pour Rails 2
	ActionController::Routing::Routes.draw do |map|
		map.resources :commands, :member => { :execute => :get }

		#Le menu
		map.admin '/admin_menu', :controller => 'admin_menu'

		#Les outils
		map.admin '/admin/inflexions',		:controller => 'admin_inflexions'
		map.admin '/admin/translations',	:controller => 'admin_translations'
		map.admin '/admin/routes',			:controller => 'admin_routes'
		map.admin '/admin/gems',			:controller => 'admin_gems'

		map.admin '/admin/dev_infos',		:controller => 'admin_dev_infos'
		map.admin '/admin/url_infos',		:controller => 'admin_url_infos'

		map.admin '/admin/commands',		:controller => 'commands'
		map.admin '/admin/send_file',		:controller => 'admin_send_file'
	end
end
