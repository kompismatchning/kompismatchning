# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kompismatchning
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.default_locale = :sv

    # Be sure to have the adapter's gem in your Gemfile
    # and follow the adapter's specific installation
    # and deployment instructions.
    config.active_job.queue_adapter = :sidekiq

    # The time after which to send a follow up email to match participants.
    config.follow_up_matches_after = 1.month

    # The time after which to automatically conclude matches.
    config.conclude_matches_after = 6.months

    # The time after which to automatically destroy concluded matches and people.
    config.destroy_matches_and_people_after = 2.months
  end
end
