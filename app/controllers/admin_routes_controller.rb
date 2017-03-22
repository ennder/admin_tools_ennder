class AdminRoutesController < ApplicationController
	def index
		if Rails::VERSION::MAJOR >= 3
			all_routes = Rails.application.routes
		else
			all_routes = ActionController::Routing::Routes
		end

		if all_routes.named_routes.respond_to?(:routes)
			@routes_hash = all_routes.routes
			@named_routes_hash = all_routes.named_routes.routes
		else
			@routes_hash = all_routes.routes.to_a
			@named_routes_hash = all_routes.named_routes.to_a
		end

		respond_to do |format|
			format.html # index.html.erb
		end
	end
end
