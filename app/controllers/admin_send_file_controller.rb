class AdminSendFileController < ApplicationController
	def index
	end

	def download
		send_file params[:chemin], :type=>"video/x-msvideo", :x_sendfile=>true
	end
end
