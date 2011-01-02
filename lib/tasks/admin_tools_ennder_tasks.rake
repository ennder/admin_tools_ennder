namespace :admin_tools_ennder do
  desc "Synchronise les migrations du plugin admin_tools_ennder vers l'appli"
  task :sync do
    system "rsync -ruv vendor/plugins/admin_tools_ennder/db/migrate db"
#    system "rsync -ruv vendor/plugins/admin_tools_ennder/public ."
  end
end