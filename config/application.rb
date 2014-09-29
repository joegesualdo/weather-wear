require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WeatherWear
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

   # TODO: As a proof of concept to not get the error:
  #   XMLHttpRequest cannot load http://localhost:3001/api/v1/users. No 'Access-Control-Allow-Origin' 
  #   header is present on the requested resource. Origin 'http://localhost:4200' is therefore not 
  #   allowed access.
  # Below I allowed all origins and all resources to make post requests, we must change this
  # before pushing to production
  # https://github.com/cyu/rack-cors
   config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
        # resource %r{/users/\d+.json},
        # :headers => ['Origin', 'Accept', 'Content-Type'],
        # :methods => [:put, :delete]
      end
    end

  end
end

# This Rails configuration will apply to production, development, and test
# if you have specific configuration for any of those specific enironments, add 
# them to config/environments/{env}.rb files
Rails.application.configure do
# The code opens the config/local_env.yml file, reads each key/value pair, and sets environment variables.
  config.before_configuration do
    env_file = File.join(Rails.root, 'config', 'local_env.yml')
    YAML.load(File.open(env_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(env_file)
  end
end
