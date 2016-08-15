namespace :matches do
  desc "Send follow up mails"
  task follow_up_mails: :environment do
    Match.all.each do |match|
      MatchMailer.follow_up_mail(match).deliver_later
    end
  end
end
