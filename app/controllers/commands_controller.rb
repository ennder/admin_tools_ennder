require "open4"

class CommandsController < ApplicationController
  if respond_to?(:before_action)
    before_action :authenticate_commands, except: [:index, :show, :new, :destroy]
  else
    before_filter :authenticate_commands, except: [:index, :show, :new, :destroy]
  end

  # GET /commands
  # GET /commands.xml
  def index
    @commands_nb = Command.count
    @commands = Command.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commands }
    end
  end

  # GET /commands/1
  # GET /commands/1.xml
  def show
    @command = Command.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @command }
    end
  end

  # GET /commands/new
  # GET /commands/new.xml
  def new
    @command = Command.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @command }
    end
  end

  # POST /commands
  # POST /commands.xml
  def create
    @command = Command.new(command_params)

    respond_to do |format|
      _result = @command.save
      @commands_nb = Command.count
      @commands = Command.all

      if _result
#        @command_result = %x[#{@command.execute.to_s}]
        execute_command

        @command = Command.new
        format.html { render :action => "new" }
        format.xml  { render :xml => @command, :status => :created, :location => @command }
      else
        format.html { redirect_to(@command) }
        format.xml  { render :xml => @command.errors, :status => :unprocessable_entity }
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
      format.xml  { render :xml => @command }
    end
  end

  # GET /commands/1/executed
  # GET /commands/1/executed.xml
  def executed
    @command = Command.find(params[:id])

    respond_to do |format|
      format.html { render :action => "execute" }
      format.xml  { render :xml => @command }
    end
  end

  # DELETE /commands/1
  # DELETE /commands/1.xml
  def destroy
    @command = Command.find(params[:id])
    @command.destroy

    respond_to do |format|
      format.html { redirect_to(commands_url) }
      format.xml  { head :ok }
    end
  end


private

  def authenticate_commands
    authenticate_or_request_with_http_basic do |name, password|
      auth_password_admin = nil
      begin
        auth_password_admin = get_auth_password_admin
      rescue Exception => e
        Rails.logger.error "==>commands_controller #{e.message}"
      end

      if auth_password_admin
        name == 'admin' && password == auth_password_admin
      else
        false
      end
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

  def command_params
    params.require(:command).permit(
        :execute
      )
  end

  def get_auth_password_admin
    auth_password_file = File.join(Rails.root.to_s, 'config', 'auth_password_admin.secret')

    auth_password_admin = nil
    if File.readable? auth_password_file
      auth_password_admin = File.read(auth_password_file).chomp
    else
      raise "#{auth_password_file} not found or not readable, can't check http authentification password"
    end

    auth_password_admin
  end
end
