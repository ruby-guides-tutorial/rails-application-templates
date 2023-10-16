gem_group :development, :test do
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
end

run_bundle
run "bundle binstub rspec-core"
generate 'rspec:install'
append_to_file '.rspec', '--format doc'

# uncomment_lines 'spec/rails_helper.rb', /support.*require/
# comment_lines 'spec/rails_helper.rb', /.*fixture_path.*/


inject_into_class 'config/application.rb', 'Application' do
  <<-EOS.strip_heredoc.indent(4)

    # RSpec
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        # 如果是大型应用，路由很复杂，最好还 是测试一下
        routing_specs: false,
        # 若想跳过 控制器测试
        controller_specs: false
    end
  EOS
end

git add: "."
git commit: %Q{ -m 'RSpec' }