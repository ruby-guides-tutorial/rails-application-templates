gem_group :development, :test do
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

run_bundle

generate 'rspec:install'
uncomment_lines 'spec/rails_helper.rb', /support.*require/

git add: "."
git commit: %Q{ -m 'RSpec' }