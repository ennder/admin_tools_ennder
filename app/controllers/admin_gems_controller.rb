if Rails::VERSION::MAJOR >= 3
	require 'bundler'
end

class AdminGemsController < ApplicationController
	def index
		#mygems = Bundler.load.specs.map { |spec| spec.name }

		if Rails::VERSION::MAJOR < 3
			application_gems = Rails.configuration.gems
		else
			application_gems = Bundler.load.specs
		end

		@application_gems = application_gems.collect{|g|
			[
				g.name,
				( (Rails::VERSION::MAJOR < 3) ? g.requirement : g.version.to_s ) || '?'
			]
		}.sort!{|a, b|
			a[0] <=> b[0]
		}
	end
end
