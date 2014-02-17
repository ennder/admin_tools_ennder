# Load any model classes
Dir[Rails.root.to_s + '/app/models/**/*.rb'].each do |file| 
	begin
#    puts "loading #{file}"
		require file
	rescue
    Rails.logger.error "GTM: Error loading #{file}"
	end
end
	
models = ActiveRecord::Base.descendants.map(&:name)

models.each do |model|
	print model
	print '  '
end

=begin
class Class
	def extend?(klass)
		not superclass.nil? && ( superclass == klass || superclass.extend? klass )
	end
end

def models
	Module.constants.select do |constant_name|
		constant = eval constant_name
		if (
			! constant.nil? &&
			constant.is_a? Class &&
			constant.extend? ActiveRecord::Base
		)
			constant
		end
	end
end

def all_models
  # must eager load all the classes...
  Dir.glob("#{RAILS_ROOT}/app/models/**/*.rb") do |model_path|
    begin
      require model_path
    rescue
      # ignore
    end
  end
  # simply return them
  ActiveRecord::Base.send(:subclasses)
end

def load_models_in_development
  if Rails.env == "development"
    load_models_for(Rails.root)
    Rails.application.railties.engines.each do |r|
      load_models_for(r.root)
    end
  end
end

def load_models_for(root)
  Dir.glob("#{root}/app/models/**/*.rb") do |model_path|
    begin
      require model_path
    rescue
      # ignore
    end
  end
end

Rails.application.eager_load! unless Rails.configuration.cache_classes

def list_models
  Dir.glob("#{Rails.root}/app/models/*.rb").map{|x| x.split("/").last.split(".").first.camelize}
end
=end