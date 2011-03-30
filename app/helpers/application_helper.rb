module ApplicationHelper
	if Rails::VERSION::MAJOR >= 3
		def periodically_call_remote(options = {})
			frequency = options[:frequency] || 10 # every ten seconds by
			default
			code = "new PeriodicalExecuter(function() {#{remote_function(options)}}, #{frequency})"
			javascript_tag(code)
		end
	end
end
