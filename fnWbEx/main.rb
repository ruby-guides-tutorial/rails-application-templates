def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'fuubar', '~> 2.5', '>= 2.5.1'
  gem 'shoulda-matchers', '~> 5.3'
end

run_bundle
run "bundle binstub rspec-core"
generate 'rspec:install'


create_file 'spec/support/.keep'
uncomment_lines 'spec/rails_helper.rb', /support.*require/

# comment_lines 'spec/rails_helper.rb', /.*fixture_path.*/


inject_into_class 'config/application.rb', 'Application' do
  <<-EOS.strip_heredoc.indent(4)

    # RSpec
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false
    end
  EOS
end


# Fuubar
append_to_file '.rspec', '--format Fuubar'

# Shoulda Matchers
copy_file 'shoulda.rb', 'spec/support/shoulda.rb'

git add: "."
git commit: %Q{ -m 'RSpec' }