class ProcessusController < ApplicationController
  def liste
    render :text => Time.new.strftime("%Y-%m-%d_%H:%M:%S") + '<br/>' + `ps -edfH`
  end

  def liste_refreshed
  end
end
