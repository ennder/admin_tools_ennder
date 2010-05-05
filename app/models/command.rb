class Command < ActiveRecord::Base
	#Pour will_paginate
	cattr_reader :per_page
	@@per_page = 10
end
