def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem_group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
end


# 让 Rails 生成器在生成模型时自动创建对应的预构件
# 打开 config/application.rb 文 件，把 fixtures: false, 这行删掉

run_bundle
copy_file 'factory_bot.rb', 'spec/support/factory_bot.rb'
uncomment_lines 'spec/rails_helper.rb', /support.*require/