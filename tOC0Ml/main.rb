def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
end

run_bundle

comment_lines 'spec/rails_helper.rb', /.*use_transactional_fixtures.*/
copy_file 'database_cleaner.rb', 'spec/support/database_cleaner.rb'