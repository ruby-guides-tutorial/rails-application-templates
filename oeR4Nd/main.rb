def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'capybara', '~> 3.39', '>= 3.39.2'
  gem 'launchy', '~> 2.5', '>= 2.5.2'
  gem 'selenium-webdriver', '~> 4.14'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.26'
end

run_bundle

# capybara
insert_into_file 'spec/rails_helper.rb', :after => /additional.*\s/ do
  <<-EOS.strip_heredoc
    require 'capybara/rspec'
    require 'capybara-screenshot/rspec'
  EOS
end

# selenium-webdriver
copy_file 'capybara.rb', 'spec/support/capybara.rb'