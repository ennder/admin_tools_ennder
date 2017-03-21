# -*- coding: utf-8 -*-

if Rails::VERSION::MAJOR >= 4
  begin
#    puts "Engine admin_tools_ennder, config/routes.rb : [#{Rails.application.routes.routes.size}] route(s)"

    _routes = Rails.application.routes
    _nb_routes_avant = _routes.routes.size

    _routes.draw do
      resources :commands do
        member do
          get 'execute'
        end
      end

      resources :admin_dev_infos, only: [:show]

      #Le menu
      match 'admin/menu'            => 'admin_menu#index',         :via => [:get]
      match 'admin'                 => 'admin_menu#index',         :via => [:get]

      #Les outils
      match 'admin/inflexions'      => 'admin_inflexions#index',   :via => [:get]
      match 'admin/translations'    => 'admin_translations#index', :via => [:get]
      match 'admin/routes'          => 'admin_routes#index',       :via => [:get]
      match 'admin/gems'            => 'admin_gems#index',         :via => [:get]
      match 'admin/dev_infos'       => 'admin_dev_infos#index',    :via => [:get]
      match 'admin/url_infos'       => 'admin_url_infos#index',    :via => [:get]
      match 'admin/commands'        => 'commands#index',           :via => [:get]
      match 'admin/send_file'       => 'admin_send_file#index',    :via => [:get]
      match 'admin/processus_liste' => 'processus#index',          :via => [:get]
      match 'admin/gmm'             => 'gmm#index',                :via => [:get]
    end

    puts "Engine admin_tools_ennder,   config/routes.rb, Rails 4 : route(s) #{_nb_routes_avant} -> #{_routes.routes.size}"
  rescue
    puts "Engine admin_tools_ennder,   config/routes.rb, Rails 4 : exception : #{$!}"
  end
else
  begin
#    puts "Engine admin_tools_ennder, config/routes.rb : [#{Rails.application.routes.routes.size}] route(s)"

    _routes = Rails.application.routes
    _nb_routes_avant = _routes.routes.size

    _routes.draw do
      resources :commands do
        member do
          get 'execute'
        end
      end

      resources :admin_dev_infos, only: [:show]

      #Le menu
      match 'admin/menu'            => 'admin_menu#index'
      match 'admin'                 => 'admin_menu#index'

      #Les outils
      match 'admin/inflexions'      => 'admin_inflexions#index'
      match 'admin/translations'    => 'admin_translations#index'
      match 'admin/routes'          => 'admin_routes#index'
      match 'admin/gems'            => 'admin_gems#index'
      match 'admin/dev_infos'       => 'admin_dev_infos#index'
      match 'admin/url_infos'       => 'admin_url_infos#index'
      match 'admin/commands'        => 'commands#index'
      match 'admin/send_file'       => 'admin_send_file#index'
      match 'admin/processus_liste' => 'processus#index'
      match 'admin/gmm'             => 'gmm#index'
    end

    puts "Engine admin_tools_ennder,   config/routes.rb, Rails 3 : route(s) #{_nb_routes_avant} -> #{_routes.routes.size}"
  rescue
    puts "Engine admin_tools_ennder,   config/routes.rb, Rails 3 : exception : #{$!}"
  end
end
