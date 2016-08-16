class MatchMailer < ActionMailer::Base
  default from: "test@example.com"

  def follow_up_mail(match)
    @match = match
    mail(to: [match.newcomer.email, match.established.email], subject: "Uppföljning")
  end
end
