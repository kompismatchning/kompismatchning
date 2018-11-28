# frozen_string_literal: true

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
    @content =
      if @person.established?
        config.conclusion_mail_content_for_established
      else
        config.conclusion_mail_content_for_newcomer
      end

    mail(from: config.mail_from,
         subject: config.conclusion_mail_subject,
         to: [person.email])
  end

  private

  def config
    @config ||= Config.first
  end
end
