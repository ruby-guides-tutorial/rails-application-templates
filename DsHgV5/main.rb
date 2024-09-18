def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end


gem 'rolify', '~> 6.0', '>= 6.0.1'
gem 'pundit', '~> 2.4'


run_bundle
