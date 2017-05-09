class AddConclusionMail < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :conclusion_mail_sent_at, :datetime
    add_column :matches, :send_conclusion_mail, :boolean, default: true
  end
end
