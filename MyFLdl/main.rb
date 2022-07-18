def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

run_bundle

copy_file 'shoulda_matchers.rb', 'spec/support/shoulda_matchers.rb'

git add: "."
git commit: %Q<-m 'Shoulda Matchers'>
