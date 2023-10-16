def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'capybara', '~> 3.39', '>= 3.39.2'
  gem 'selenium-webdriver', '~> 4.14'
  gem 'launchy', '~> 2.5', '>= 2.5.2'
end

run_bundle

# capybara
insert_into_file 'spec/rails_helper.rb',
    "\nrequire 'capybara/rspec'",
    :after => /additional.*\s/

# selenium-webdriver
copy_file 'capybara.rb', 'spec/support/capybara.rb'