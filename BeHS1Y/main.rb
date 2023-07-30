gem_group :development do
  gem 'capistrano', '~> 3.17', '>= 3.17.3'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-rails', '~> 1.6', '>= 1.6.3'
  gem 'capistrano-bundler', '~> 2.1'
  gem 'capistrano3-puma', '~> 5.2'
end

run_bundle
run "bundle exec cap install"

git add: "."
git commit: %Q<-m 'capistrano init'>


domain = ask('domain: ')
repo   = ask('repository: ')

# Capistrano
gsub_file 'config/deploy.rb', /(set\s+:application,).*/, %Q<\\1 "#{app_name}">
gsub_file 'config/deploy.rb', /(set\s+:repo_url,).*/, %Q<\\1 "#{repo}">
uncomment_lines 'config/deploy.rb', /ask\s+:branch/
gsub_file 'config/deploy.rb', /(#\s+)(set\s+:deploy_to,).*/, %q<\2 "/var/www/#{fetch(:application)}">

prepend_to_file 'config/deploy/production.rb' do
  <<-EOS.strip_heredoc
    server '#{domain}', user: '#{app_name}', roles: %w{app db web}
  EOS
end

# Capistrano::rbenv
uncomment_lines 'Capfile', /require.*rbenv/
append_to_file 'config/deploy.rb' do
  <<-EOS.strip_heredoc

  # rbenv
  set :rbenv_type, :user
  set :rbenv_ruby, '3.1.4'
  EOS
end

# Capistrano::Bundler
uncomment_lines 'Capfile', /require.*bundle/
append_to_file 'config/deploy.rb' do
  <<-EOS.strip_heredoc

  # bundler 
  append :linked_dirs, ".bundle"
  EOS
end

# Capistrano::Rails
uncomment_lines 'Capfile', /require.*assets/
uncomment_lines 'Capfile', /require.*migrations/
uncomment_lines 'config/deploy.rb', /append\s:linked_dirs/


# Capistrano::Puma
insert_into_file 'Capfile', :after => /require.*passenger.*\s/ do
  <<-EOS.strip_heredoc
    require 'capistrano/puma'
    install_plugin Capistrano::Puma
    install_plugin Capistrano::Puma::Nginx
    install_plugin Capistrano::Puma::Systemd
  EOS
end


insert_into_file 'config/deploy.rb' do
  <<-EOS.strip_heredoc

    set :puma_service_unit_env_file, '/etc/environment'
    set :puma_phased_restart, true
    set :puma_init_active_record, true


    set :nginx_server_name, "#{domain}"
  EOS
end

gsub_file 'config/deploy.rb', "config/database.yml", "coinfig/master.key"