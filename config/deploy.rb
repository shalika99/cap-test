# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "cap-test"
set :repo_url, "git@github.com:shalika99/cap-test.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# set :stage, :development
set :default_stage, "staging"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "~/CureApp-1/deploy2/cap-test"
# set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
#set :linked_files, fetch(:linked_files, []).push('config/database.yml')
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, {"config/database.yml", "config/secrets.yml"}

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# rbenvの設定
# set :rbenv_type, :system    # rbenv_custom_pathを指定していれば不要
# set :rbenv_ruby, '2.3.1'    # rubyのバージョン（事前に指定バージョンをインストールしておく必要あり。）
# set :rbenv_custom_path, '/Users/sharika/.rbenv'    # rbenvのインストール先
# set :rbenv_map_bins, %w{rake gem bundle ruby rails} # rbenv execをつけたいコマンド

# localhost の ssh を許可しておくこと
role :local, "127.0.0.1"

namespace :deploy do
after 'deploy:publishing', 'deploy:restart'

desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Upload database.yml secrets.yml'
  # task :upload do
  #   on roles(:app) do |host|
  #     if test "[ ! -d #{shared_path}/config ]"
  #       execute "mkdir -p #{shared_path}/config"
  #     end
  #     upload!('config/database.yml', "#{shared_path}/config/database.yml")
  #     upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
  #   end
  # end
  # before :starting, 'deploy:upload'
end
