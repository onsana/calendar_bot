require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FemCalendarBot
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    config.application_name = Rails.application.class.module_parent_name 
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.time_zone = "Kyiv"
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.available_locales = [:en, :uk]
    config.i18n.default_locale = :uk
    config.i18n.fallbacks = true

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.generators do |g|
      g.assets false
      g.helper false
      g.controller_specs false
      g.factory_bot true
      g.fixture_replacement :factory_bot, dir: "spec/factories"
      g.helper_specs false
      g.system_tests false
      g.view_specs false
      g.test_framework :rspec
    end
  end
end
