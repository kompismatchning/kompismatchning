# frozen_string_literal: true

namespace :matches do
  desc "Send mails"
  task mails: ["matches:follow_up_mails", "matches:conclusion_mails"]

  desc "Send follow up mails"
  task follow_up_mails: :environment do
    matches_to_process = Match.follow_up_mails

    puts "Sending follow up mails to #{matches_to_process.count} matches"

    matches_to_process.each do |match|
      MatchMailer.follow_up_mail(match).deliver_later
      match.follow_up_mail_sent_at = Time.zone.now
      match.save
    end
  end

  desc "Send conclusion mails"
  task conclusion_mails: :environment do
    matches_to_process = Match.conclusion_mails

    puts "Sending conclusion mails to #{matches_to_process.count} matches"

    matches_to_process.each do |match|
      MatchMailer.conclusion_mail(match.established).deliver_later
      MatchMailer.conclusion_mail(match.newcomer).deliver_later
      match.conclusion_mail_sent_at = Time.zone.now
      match.save
    end
  end
end
