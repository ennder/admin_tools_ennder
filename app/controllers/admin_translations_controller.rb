# -*- coding: utf-8 -*-
class AdminTranslationsController < ApplicationController
	def index
		#TODO Ennder correction : Rails 3 ? I18n.backend.send(:translations) renvoie une liste vide
		begin
			@traductions_all = I18n.backend.send(:translations)
		rescue _exception
			@traductions_all = []
			logger.error "échec I18n.backend.send(:translations) [#{_exception.message}]"
		end
		logger.debug "[#{@traductions_all.size}] traduction(s)"

		@locales_list = I18n.available_locales.inject(''){ |list, l|
			list << '&nbsp;&nbsp;<b>' + l.to_s + '</b>'
		}

		respond_to do |format|
			format.html # index.html.erb
		end
	end
end
