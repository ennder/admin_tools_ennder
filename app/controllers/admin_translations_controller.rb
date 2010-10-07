class AdminTranslationsController < ApplicationController
	def index
		#TODO correction : I18n.backend.send(:translations) renvoie une liste vide
		@traductions_all = I18n.backend.send(:translations)
		logger.debug "[#{@traductions_all.size}] traduction(s)"

		respond_to do |format|
			format.html # index.html.erb
		end
	end
end
