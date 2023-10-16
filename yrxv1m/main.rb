def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'faker', '~> 2.21'
end

run_bundle

copy_file 'bank.yml', 'config/locales/faker/bank.yml'

append_to_file 'config/initializers/locale.rb' do
  <<-EOS.strip_heredoc

    Faker::Config.locale = 'zh-CN'
  EOS
end