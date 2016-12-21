# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rvm"
require "capistrano/rbenv"
# require "capistrano/chruby"
require "capistrano/bundler"
# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
# require "capistrano/passenger"
require 'rails'
require 'capistrano3-unicorn'
require 'capistrano3/ridgepole'

# set :rbenv_type, :user
# set :rbenv_ruby, '2.3.1'
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets public/uploads}

# Target server(role) where you'll apply the database schema settings.
set :ridgepole_roles, :db

# Path of Schemafile  (default path is root of your app directory)
set :ridgepole_schema_file, File.join((fetch(:current_path)), "Schemafile")

# Path of database.yml (default path is config/database.yml)
set :ridgepole_config_file, File.join(fetch(:current_path), "config", "database.yml")

# Environment of rails application that you'd apply schema. (default env is "development")
set :ridgepole_env, fetch(:rails_env)

# Additional ridgepole options (default is empty)
set :ridgepole_options, "--alter-extra='LOCK=NONE' --debug"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
