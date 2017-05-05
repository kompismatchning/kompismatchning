class MatchMailerPreview < ActionMailer::Preview
  def follow_up_mail
    MatchMailer.follow_up_mail(match)
  end

  def conclusion_mail_for_established
    MatchMailer.conclusion_mail(match.established)
  end

  def conclusion_mail_for_newcomer
    MatchMailer.conclusion_mail(match.newcomer)
  end

  private

  def match
    Match.new(
      established: Person.new(name: "Established", email: "established@example.com", status: :established),
      newcomer: Person.new(name: "Newcomer", email: "newcomer@example.com", status: :newcomer),
      created_at: Time.zone.now
    )
  end
end
