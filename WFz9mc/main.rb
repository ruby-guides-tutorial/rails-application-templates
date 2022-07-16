def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
end

run_bundle

copy_file 'factory_bot.rb', 'spec/support/factory_bot.rb'

uncomment_lines 'spec/rails_helper.rb', /support.*require/