class AdminInflexionsController < ApplicationController
	def index
		@inflections_plur = ActiveSupport::Inflector.inflections.plurals
		@inflections_sing = ActiveSupport::Inflector.inflections.singulars
	end
end
