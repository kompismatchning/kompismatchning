# frozen_string_literal: true

class AddMoreColumnsToConfig < ActiveRecord::Migration[5.0]
  def change
    add_column :configs, :conclusion_mail_subject, :string, null: false
    add_column :configs, :conclusion_mail_content_for_established, :string, null: false
    add_column :configs, :conclusion_mail_content_for_newcomer, :string, null: false
  end
end
