require 'sidekiq'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] and password == ENV['SIDEKIQ_PASSWORD']
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

require 'sidekiq/web'
run Sidekiq::Web
