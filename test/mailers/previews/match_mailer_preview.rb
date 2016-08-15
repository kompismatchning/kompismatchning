class MatchMailerPreview < ActionMailer::Preview
  def follow_up_mail
    MatchMailer.follow_up_mail(match)
  end

  def final_follow_up_mail
    MatchMailer.final_follow_up_mail(match)
  end

  private

  def match
    Match.new(
      established: Person.new(name: "Established", email: "established@example.com"),
      newcomer: Person.new(name: "Newcomer", email: "newcomer@example.com"),
      created_at: Time.zone.now
    )
  end
end
