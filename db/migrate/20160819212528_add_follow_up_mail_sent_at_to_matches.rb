class AddFollowUpMailSentAtToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :follow_up_mail_sent_at, :datetime
  end
end
