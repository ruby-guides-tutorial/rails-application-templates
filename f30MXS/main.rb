def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'capybara', '~> 3.39', '>= 3.39.2'
  gem 'launchy', '~> 2.5', '>= 2.5.2'
  gem 'cuprite', '~> 0.14.3'
end


run_bundle

# capybara
insert_into_file 'spec/rails_helper.rb', :after => /additional.*\s/ do
  <<-EOS.strip_heredoc
    require 'capybara/rspec'
    require "capybara/cuprite"
  EOS
end

