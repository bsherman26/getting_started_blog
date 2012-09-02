require "bundler/capistrano"
load "deploy/assets"
set :application, "getting_started_blog"
set :repository,  "git://github.com/bsherman26/getting_started_blog.git"

set :scm, :git
set :deploy_to, "/apps/getting_started_blog"
set :user, "brian"
role :web, "basileis.com"                          # Your HTTP server, Apache/etc
role :app, "basileis.com"                          # This may be the same as your `Web` server
role :db,  "basileis.com", :primary => true # This is where Rails migrations will run
default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end
