set :application, "local.browserstack.com"
set :scm, :git
#set :repository,  "https://github.com/browserstack/repeater-setup.git"
set :repository,  "https://github.com/anilbrowserstack/DeviseRapidShare.git"
set(:dir, 'repeater-setup') unless exists?(:dir)
set :ssh_options, {:auth_methods => 'publickey'}
ssh_options[:verbose] = :debug
set :deploy_to, "/Users/test1/#{dir}"
set :use_sudo, false

role :libs, "local.browserstack.com" 

task :basic do
  run "ls"
end

task :development do
  role :dev, "local.browserstack.com"
  set :user, "test1"
  set :repository, "https://github.com/anilbrowserstack/DeviseRapidShare.git"
#set :repository, "git@github.com:browserstack/repeater-setup.git"
  set :scm, :git
  set :deploy_via, :remote_cache
  set(:branch, 'master') unless exists?(:branch)
  set(:dir, 'repeater-setup') unless exists?(:dir)
  set :copy_exclude, [ '.git' ]
#set :application, "repeater-setup"
  set :deploy_to_prefix,"/Users/test1/#{dir}"
  set :deploy_to, "/Users/test1/#{dir}"
  set :use_sudo, false
  set(:host, '/Users/test1/repeater-setup') unless exists?(:host)
#set :keep_releases, 6
#set(:message, 'on prod') unless exists?(:message)
#set(:email, 0) unless exists?(:email)
end

task :repeater_deploy_development, :roles => :dev do
#run "cd #{host}; git checkout .;git pull; git checkout #{branch}; git pull;"
  run "cd #{host}/current; git checkout .;git pull; git checkout #{branch}; git pull;"
end
