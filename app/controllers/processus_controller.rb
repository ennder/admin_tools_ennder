class ProcessusController < ApplicationController
  def index
  end

  def index_static
    render :text => Time.new.strftime("%Y-%m-%d_%H:%M:%S") + '<br/>' + `ps -edfH`
  end
end
