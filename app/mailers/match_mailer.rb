class MatchMailer < ApplicationMailer
  helper :markdown

  def follow_up_mail(match)
    @match = match
    @content = config.follow_up_mail_content

    mail(from: config.mail_from,
         subject: config.follow_up_mail_subject,
         to: [match.newcomer.email, match.established.email])
  end

  def conclusion_mail(person)
    @person = person
    @survey_link = @person.established? ? Rails.configuration.survey_link_for_established : Rails.configuration.survey_link_for_newcomer
    mail(from: Rails.configuration.mail_from,
         subject: Rails.configuration.conclusion_mail_subject,
         to: [person.email])
  end

  private

  def config
    @_config ||= Config.first
  end
end
