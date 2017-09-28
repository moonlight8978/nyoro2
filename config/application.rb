require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nyoro2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    I18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja
    config.i18n.fallbacks = true
    
    config.time_zone = 'Asia/Bangkok'
    Groupdate.time_zone = 'Asia/Bangkok'
    config.active_record.default_timezone = :utc
    
    # config.active_record.default_timezone = :local

    config.autoload_paths << Rails.root.join('lib')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('node_modules')
    config.assets.paths += Dir["#{Rails.root}/app/assets/libs/**"]
    
    # Devise
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    
    # Errors
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
      html_tag.html_safe
    end
    
    # Sidekiq
    config.active_job.queue_adapter = :sidekiq
  end
end
