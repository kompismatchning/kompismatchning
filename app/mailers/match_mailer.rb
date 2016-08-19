class MatchMailer < ActionMailer::Base
  default from: "duo.stockholm@manniskohjalp.se"

  def follow_up_mail(match)
    @match = match
    mail(to: [match.newcomer.email, match.established.email], subject: "Uppföljning")
  end
end
