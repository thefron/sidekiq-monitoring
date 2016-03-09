require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

require 'sidekiq/web'
run Sidekiq::Web
