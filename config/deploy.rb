
lock '3.17.0'

set :application, "k_api"

set :scm, :git

#set repo trên git
set :repo_url, "git@github.com:NguyenDangVan/k-website-api.git"

#deploy tới folder nào trên server remote
set :deploy_to, "/home/deploy/k_api"

#branch trên github. Mặc định là master
set :branch, "main"
set :pty, false
set :format, :pretty
set :user, 'deploy'

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'shared/sockets')
set :linked_files, %w(config/database.yml config/application.yml)
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :puma_user, fetch(:user)
set :pty, true
set :use_sudo, false
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :puma_threads, [4, 16]
set :puma_workers, 2
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
