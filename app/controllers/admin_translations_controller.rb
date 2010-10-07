class AdminTranslationsController < ApplicationController
	def show
		@traductions_all = I18n.backend.send(:translations)

		respond_to do |format|
			format.html # show.html.erb
		end
	end

end
