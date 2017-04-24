require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blending
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

    # The email from which to send follow up and conclusion mails.
    config.mail_from = "duo.stockholm@manniskohjalp.se"

    # The subject line of follow up mails.
    config.follow_up_mail_subject = "Duo Stockholm – 1 månad"

    # The content of follow up mails.
    config.follow_up_mail_content = %{
      <p>Hej {newcomer} och {established},</p>
      <p>Hoppas ni mår bra. Vi ville bara skriva och höra hur första månaden i Duo Stockholm har gått?</p>
      <p>Har ni haft möjlighet att träffas?</p>
      <p>Berätta gärna vad ni gjort. Har ni tagit något foto så skicka gärna. Det är kul att höra och se hur det går för er :)</p>
      <p>
        Ha en bra dag,<br>
        Jonathan och Zuraiya
      </p>
      <p>
        --<br>
        Duo Stockholm
      </p>
    }

    # The subject line of follow up mails.
    config.conclusion_mail_subject = "Duo Stockholm – 6 månader"

    # The content of follow up mails.
    config.conclusion_mail_content = %{
      <p>Hej {newcomer} och {established},</p>
      <p>Placeholder</p>
      <p>
        Ha en bra dag,<br>
        Jonathan och Zuraiya
      </p>
      <p>
        --<br>
        Duo Stockholm
      </p>
    }
  end
end
