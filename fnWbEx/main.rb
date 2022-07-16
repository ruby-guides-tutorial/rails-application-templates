gem_group :development, :test do
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

run_bundle

run "bundle binstub rspec-core"

generate 'rspec:install'
uncomment_lines 'spec/rails_helper.rb', /support.*require/


# inject_into_class 'config/application.rb', 'Application' do
#   <<-EOS.strip_heredoc.indent(4)
#     # Setting for Rspec
#     config.generators do |g|
#       g.test_framework :rspec,
#         view_specs: false,
#         helper_specs: false,
#         routing_specs: false,
#         controller_specs: false
#     end
#   EOS
# end

git add: "."
git commit: %Q{ -m 'RSpec' }