# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class ProcessusListe
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/admin\/processus_liste/
      [200, {"Content-Type" => "text/html"}, [Time.new.strftime("%Y-%m-%d_%H:%M:%S") + '<br/>' + `ps -edfH`]]
    else
      [404, {"Content-Type" => "text/html"}, ["Pas Trouvé"]]
    end
  end
end
