namespace :matches do
  desc "Send follow up mails"
  task follow_up_mails: :environment do
    Match.active
         .where("started_at < ?", Rails.configuration.follow_up_matches_after.from_now)
         .where(follow_up_mail_sent_at: nil)
         .each do |match|
      MatchMailer.follow_up_mail(match).deliver_later
      match.follow_up_mail_sent_at = Time.zone.now
      match.save
    end
  end
end
