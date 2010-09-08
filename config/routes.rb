ActionController::Routing::Routes.draw do |map|
	map.resources :commands

	#Le menu
	map.admin '/admin_menu', :controller => 'admin_menu'

	#Les outils
	map.admin '/admin/inflexions', :controller => 'admin_inflexions'
	map.admin '/admin/translations', :controller => 'admin_translations'
	map.admin '/admin/dev_infos', :controller => 'admin_dev_infos'
	map.admin '/admin/url_infos', :controller => 'admin_url_infos'

	map.admin '/admin/routes_infos', :controller => 'admin_routes_infos'
	map.admin '/admin/commands', :controller => 'commands'

	map.admin '/admin/send_file', :controller => 'admin_send_file'
end
