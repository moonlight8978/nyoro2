require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nyoro2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    config.time_zone = 'Asia/Bangkok'
    config.active_record.default_timezone = :local

    config.autoload_paths << Rails.root.join('lib')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('node_modules')
    
    # Devise
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    
    # Errors
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
      html_tag.html_safe
    end
  end
end
