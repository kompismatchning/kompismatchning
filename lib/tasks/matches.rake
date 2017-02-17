namespace :matches do
  desc "Send follow up mails"
  task follow_up_mails: :environment do
    matches_to_process = Match.active
                              .where("started_at < ?", Rails.configuration.follow_up_matches_after.ago)
                              .where(follow_up_mail_sent_at: nil)
                              .where(send_follow_up_mail: true)

    puts "Sending follow up mails to #{matches_to_process.count} matches"

    matches_to_process.each do |match|
      MatchMailer.follow_up_mail(match).deliver_later
      match.follow_up_mail_sent_at = Time.zone.now
      match.save
    end
  end
end
