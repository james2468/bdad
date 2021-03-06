set :application, 'bdad'
set :repository,  'git@github.com:sunlightlabs/bdad.git'
set :scm,         :git
set :user,        'bdad'
set :use_sudo,    false
set :deploy_via,  :remote_cache
set :deploy_to,   '/projects/bdad/src/bdad'
set :domain,      'dupont-bdad' # see .ssh/config
set :branch,      'production'

role :web, domain
role :app, domain
role :db,  domain, :primary => true

require 'bundler/deployment'

namespace :deploy do
  task :start do
    # ...
  end

  task :stop do
    # ...
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    # ...
  end

  task :symlink_config do
    shared_config = File.join(shared_path, 'config')
    release_config = "#{release_path}/config"
    %w{database admin analytics}.each do |file|
      run "ln -s #{shared_config}/#{file}.yml #{release_config}/#{file}.yml"
    end
  end
end

after 'deploy:update_code' do
  deploy.symlink_config
end
