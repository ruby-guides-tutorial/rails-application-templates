def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem 'jbuilder', '~> 2.11', '>= 2.11.5'
gem 'oj', '~> 3.13', '>= 3.13.14'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

run_bundle


copy_file 'welcome_controller.rb', 'app/controllers/welcome_controller.rb'
copy_file 'index.json.jbuilder', 'app/views/welcome/index.json.jbuilder'
copy_file 'index.html.erb', 'app/views/welcome/index.html.erb'

remove_file "config/initializers/cors.rb"
copy_file "cors.rb", "config/initializers/cors.rb"

route "root 'welcome#index'"

git add: "."
git commit: %Q<-m 'Support Api'>