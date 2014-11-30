<<<<<<< HEAD
# config valid only for current version of Capistrano
lock '3.3.3'
=======
# config valid only for Capistrano 3.1
lock '3.2.1'
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663

server '46.48.230.44', port: 1985, roles: [:web, :app, :db], primary: true

set :application, 'depot'
<<<<<<< HEAD
set:repo_url, 'git@github.com:debianserver/depot.git'
=======
set :repo_url, 'git@example.com:debianserver/depot.git'
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663
set :user, 'deploy'
set :puma_threads, [4, 16]
set :puma_workers, 0
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

<<<<<<< HEAD
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
=======
# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true
set :use_sudo, false
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false
<<<<<<< HEAD

#set :scm, :git
#set :branch, :master
#set :format, :pretty
#set :log_level, :debug
#set :keep_releases, 5

# Default value for :linked_files is []
#set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
#set :linked_dirs, %w{ bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system }
=======
# Default value for :linked_files is []
set :scm, :git
set :branch, :master
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :puma do
<<<<<<< HEAD
  desc 'Create Dirs 4 Puma Pids & Sockets'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."

  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
=======
 desc 'Create Dir for Puma Pids & Sockets'
 task :make_dirs do
  on roles(:app) do
   execute "mkdir #{shared_path}/tmp/sockets -p"
   execute "mkdir #{shared_path}/tmp/pids -p"
  end
 end
 before :start, :make_dirs
end

namespace :deploy do

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master" 
        puts "Run `git push`."
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663
        exit
      end
    end
  end
<<<<<<< HEAD
 # after :restart, :clear_cache do
 #   on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
 #   end
 # end
  desc 'Initial Deploy'
=======
  
  desc 'Init deploy'
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

<<<<<<< HEAD
=======
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'puma:restart'
    end
  end

>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663
  before :starting, :check_revision
  after :finishing, :compile_assets
  after :finishing, :cleanup
  after :finishing, :restart
<<<<<<< HEAD
end



=======

#  after :publishing, :restart

#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
#    end
#  end

end
>>>>>>> 694db73acafaee7c3d5f9232f01ac63d41b5c663
