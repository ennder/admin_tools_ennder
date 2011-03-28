if Rails::VERSION::MAJOR >= 3
	require 'bundler'
end

#mygems = Bundler.load.specs.map { |spec| spec.name }

class AdminGemsController < ApplicationController
	def index
		if Rails::VERSION::MAJOR < 3
			@application_gems = Rails.configuration.gems
		else
			@application_gems = Bundler.load.specs
		end
	end
end
