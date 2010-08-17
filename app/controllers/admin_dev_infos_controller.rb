class AdminDevInfosController < ApplicationController
	def show
		if params[:nom_objet] != ''
			@l_objet = Object::const_get(params[:nom_objet]).new()
		end

		respond_to do |format|
			format.html # show.html.erb
		end
	end

end
