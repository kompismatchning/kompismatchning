# frozen_string_literal: true

class AddSendFollowUpMailToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :send_follow_up_mail, :boolean, default: true
  end
end
