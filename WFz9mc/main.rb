def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
end

run_bundle
copy_file 'factory_bot.rb', 'spec/support/factory_bot.rb'

git add: "."
git commit: %Q<-m 'factory_bot'>