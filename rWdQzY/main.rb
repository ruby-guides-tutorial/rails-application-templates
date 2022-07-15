gem_group :development, :test do
  gem 'fuubar', '~> 2.5', '>= 2.5.1'
end

run_bundle

append_to_file '.rspec', '--format Fuubar'

git add: "."
git commit: %Q{ -m 'RSpec Fuubar' }