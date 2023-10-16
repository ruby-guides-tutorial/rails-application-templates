gem_group :development, :test do
  gem 'capybara', '~> 3.39', '>= 3.39.2'
  gem 'launchy', '~> 2.5', '>= 2.5.2'
end

run_bundle

insert_into_file 'spec/rails_helper.rb',
    "\nrequire 'capybara/rspec'",
    :after => /additional.*\s/