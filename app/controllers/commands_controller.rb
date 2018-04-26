require "open4"

class CommandsController < ApplicationController
	before_filter :authenticate, :except => [:index, :show, :new, :destroy]

	# GET /commands
	# GET /commands.xml
	def index
		@commands_nb = Command.count
		@commands = Command.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml	{ render :xml => @commands }
		end
	end

	# GET /commands/1
	# GET /commands/1.xml
	def show
		@command = Command.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml	{ render :xml => @command }
		end
	end

	# GET /commands/new
	# GET /commands/new.xml
	def new
		@command = Command.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml	{ render :xml => @command }
		end
	end

	# POST /commands
	# POST /commands.xml
	def create
		@command = Command.new(params[:command])

		respond_to do |format|
			_result = @command.save
			@commands_nb = Command.count
			@commands = Command.all

			if _result
#				@command_result = %x[#{@command.execute.to_s}]
				execute_command

				@command = Command.new
				format.html { render :action => "new" }
				format.xml	{ render :xml => @command, :status => :created, :location => @command }
			else
				format.html { redirect_to(@command) }
				format.xml	{ render :xml => @command.errors, :status => :unprocessable_entity }
			end
		end
	end

	# GET /commands/1/execute
	# GET /commands/1/execute.xml
	def execute
		@command = Command.find(params[:id])
		execute_command

		respond_to do |format|
			format.html { render :action => "executed" }
			format.xml	{ render :xml => @command }
		end
	end

	# GET /commands/1/executed
	# GET /commands/1/executed.xml
	def executed
		@command = Command.find(params[:id])

		respond_to do |format|
			format.html { render :action => "execute" }
			format.xml	{ render :xml => @command }
		end
	end

	# DELETE /commands/1
	# DELETE /commands/1.xml
	def destroy
		@command = Command.find(params[:id])
		@command.destroy

		respond_to do |format|
			format.html { redirect_to(commands_url) }
			format.xml	{ head :ok }
		end
	end

	
private

	def authenticate
		authenticate_or_request_with_http_basic do |name, password|
			name == 'admin' && password == 'ttooume6969'
		end
	end
	
	def execute_command
		begin
			# pid, stdin
			_, _, stdout, stderr = Open4::popen4 @command.execute.to_s
			@command_result = stdout.read.strip
			@command_error = stderr.read.strip
		rescue Exception => e
			@command_error = "Exception: #{e.inspect}"
		end
	end
end
