# frozen_string_literal: true

class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.string :mail_from, null: false
      t.string :follow_up_mail_subject, null: false
      t.string :follow_up_mail_content, null: false

      t.timestamps
    end
  end
end
