namespace :admin_tools_ennder do
  desc "Synchronise les migrations du plugin admin_tools_ennder vers l'appli"
  task :sync do
    if Rails::VERSION::MAJOR < 5
    	system "rsync -uv plugins/admin_tools_ennder/db/migrate/rails_before_5/migrate db/migrate"
    else
    	system "rsync -uv plugins/admin_tools_ennder/db/migrate db/migrate"
    end
#    system "rsync -ruv plugins/admin_tools_ennder/public ."
  end
end