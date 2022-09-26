gem 'sidekiq', '~> 6.5', '>= 6.5.7'

run_bundle

application "config.active_job.queue_adapter = :sidekiq"

copy_file 'sidekiq.yml', 'config/sidekiq.yml'