# frozen_string_literal: true

# This migration comes from admin (originally 20160508221116)
class CreateAdminAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_admin_users do |t|
      t.string :email
      t.text :password_digest

      t.timestamps null: false
    end
  end
end
