def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

# @TODO: 不同环境下的值不同
append_to_file '.env.template' do
  <<-EOS.strip_heredoc
    #{app_name.upcase}_DATABASE_HOST=database
    #{app_name.upcase}_DATABASE_USERNAME=root
    #{app_name.upcase}_DATABASE_PASSWORD=example
  EOS
end


run 'cp .env.template .env.development.local'

template 'mysql.yml.tt', 'config/database.yml'

rails_command "db:create"
rails_command "db:migrate"

git add: "."
git commit: %Q<-m 'MySQL Initialize'>