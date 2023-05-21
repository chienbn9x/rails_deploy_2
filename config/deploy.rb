# config valid for current version and patch releases of Capistrano
lock "~> 3.17.2"

set :application, 'rails_deploy_2'
set :repo_url, 'git@github.com:chienbn9x/rails_deploy_2.git' # Edit this to match your repository

set :user, 'chiennv'
set :puma_threads, [4, 16]
set :puma_workers, 0

set :pty, true
set :use_sudo, false
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}" # '/home/chiennv/rails_deploy_2'

set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"    #accept array for multi-bind
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/chienbn9x.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

set :branch, :main
set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 2
set :rbenv_type, :user
set :rbenv_ruby, '3.2.0' # Edit this if you are using MRI Ruby

# set :puma_rackup, -> { File.join(current_path, 'config.ru') }
# set :puma_conf, "#{shared_path}/puma.rb"
# set :puma_role, :app
# set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
