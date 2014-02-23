class GmmController < ApplicationController
	def index
		unless defined?(@all_models)
			@@all_models = {}
			# Load any model classes
			Dir[Rails.root.to_s + '/app/models/**/*.rb'].each do |file|
				begin
					Rails.logger.info "GTM: loading #{file}"
					require file
				rescue
					Rails.logger.error "GTM: Error loading #{file}"
				end

				# Store it in a class object
				ActiveRecord::Base.descendants.each{|m|
					@@all_models[m.name] = {
						:has_many => m.reflect_on_all_associations(:has_many),
						:has_one => m.reflect_on_all_associations(:has_one),
						:belongs_to => m.reflect_on_all_associations(:belongs_to)
					}
				}
			end
		end

		@all_models = @@all_models
	end
end
