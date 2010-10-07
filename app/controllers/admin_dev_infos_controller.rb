class AdminDevInfosController < ApplicationController
	def show
		if params[:nom_objet].blank?
			flash[:notice] = 'Il faut spécifier un nom de Classe'
			redirect_to( :action => :index )

			return
		end

		begin
			_La_classe = Object::const_get(params[:nom_objet])
		rescue
		end

		if _La_classe.nil?
			flash[:notice] = "La Classe #{params[:nom_objet]} n'existe pas"
			redirect_to( :action => :index )

			return
		end

		@l_objet = _La_classe.new()

		respond_to do |format|
			format.html # show.html.erb
		end
	end
end
