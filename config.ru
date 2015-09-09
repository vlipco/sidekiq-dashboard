require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['SIDEKIQ_REDIS'] }
end
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['SIDEKIQ_REDIS'] }
  config.on(:startup) { puts "Connecting to #{ENV['SIDEKIQ_REDIS']}" }
  config.on(:quiet) { puts "Quiet down!" }
  config.on(:shutdown) { puts "Goodbye!" }
end

require 'sidekiq/web'
run Sidekiq::Web