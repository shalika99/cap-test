# set path to the application
#app_dir git File.expand_path("../..", __FILE__)
#shared_dir = "#{app_dir}/tmp"
#working_directory app_dir

# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Path for the Unicorn socket
listen File.expand_path('tmp/sockets/unicorn.sock', ENV['RAILS_ROOT'])

# Set path for logging
stderr_path "log/unicorn.stderr.log"
stdout_path "log/unicorn.stdout.log"

# Set proccess id path
pid "tmp/pids/unicorn.pid"
