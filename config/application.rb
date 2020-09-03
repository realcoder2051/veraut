require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StarterKit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.active_job.queue_adapter = :sidekiq

    config.eager_load_paths << Rails.root.join('lib')
    config.autoload_paths   << Rails.root.join('lib')

    Dir['domain/*/'].each do |dir|
      config.eager_load_paths << Rails.root.join("#{dir}/lib")
      config.autoload_paths   << Rails.root.join("#{dir}/lib")
    end

    # Cache store config
    if ENV['MEMCACHED_SERVER']
      options = {
        namespace: ENV['MEMCACHED_NAMESPACE'],
        expires_in: 1.day,
        compress: true,
        pool_size: ENV['MEMCACHED_POOL'] || 1
      }
      config.cache_store = :mem_cache_store, ENV['MEMCACHED_SERVER'], options
    end
  end
end
