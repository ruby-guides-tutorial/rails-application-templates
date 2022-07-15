gem_group :development, :test do
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
end

run_bundle

run "bundle exec spring binstub rspec"

git add: "."
git commit: %Q{ -m 'RSpec Spring' }