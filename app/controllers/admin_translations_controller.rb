class AdminTranslationsController < ApplicationController
	def index
		@traductions_all = I18n.backend.send(:translations)

		respond_to do |format|
			format.html # index.html.erb
		end
	end
end
