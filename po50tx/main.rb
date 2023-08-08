def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

copy_file '.dockerignore'
copy_file 'docker-entrypoint.sh'
copy_file 'Dockerfile'
copy_file 'docker-compose.yml'