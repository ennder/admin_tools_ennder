namespace :admin_tools do
  desc "Synchronise les migrations du plugin admin_tools vers l'appli"
  task :sync do
    system "rsync -ruv vendor/plugins/admin_tools/db/migrate db"
#    system "rsync -ruv vendor/plugins/admin_tools/public ."
  end
end