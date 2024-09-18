def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end


gem 'devise', '~> 4.9', '>= 4.9.4'

# rails generate devise:install

# config/environments/development.rb
# config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


rails generate devise MODEL


run_bundle
