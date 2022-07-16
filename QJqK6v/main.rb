gem_group :development do
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
end

run_bundle

run "bundle binstub guard"
run "bundle exec guard init rspec"
gsub_file 'Guardfile', /cmd: "bundle exec rspec"/, 'cmd: "bin/rspec"'


git add: "."
git commit: %Q{ -m 'Rspec Guard' }
