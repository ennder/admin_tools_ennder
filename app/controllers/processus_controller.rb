class ProcessusController < ApplicationController
  def index
    render :text => Time.new.strftime("%Y-%m-%d_%H:%M:%S") + '<br/>' + `ps -edfH`
  end

  def index_refreshed
  end
end
