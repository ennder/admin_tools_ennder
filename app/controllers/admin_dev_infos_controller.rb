class AdminDevInfosController < ApplicationController
	def show
		if params[:nom_objet].blank?
			flash[:notice] = 'Il faut spécifier un nom de Classe'
			redirect_to( :action => :index )

			return
		end


		if ! Object.const_defined?(params[:nom_objet])
			flash[:notice] = "La Classe #{params[:nom_objet]} n'existe pas"
			redirect_to( :action => :index )

			return
		end

		_La_classe = Object::const_get(params[:nom_objet])

		if ! _La_classe.respnd_to?(:new)
			flash[:notice] = "La Classe #{_La_classe} ne fournit pas la méthode new()"
			redirect_to( :action => :index )

			return
		end

		@l_objet = _La_classe.new()

		respond_to do |format|
			format.html # show.html.erb
		end
	end
end
