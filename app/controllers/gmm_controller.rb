class GmmController < ApplicationController
	def index
		# Load any model classes
		Dir[Rails.root.to_s + '/app/models/**/*.rb'].each do |file|
			begin
#				puts "loading #{file}"
				require file
			rescue
				Rails.logger.error "GTM: Error loading #{file}"
			end
		end
	end
end
