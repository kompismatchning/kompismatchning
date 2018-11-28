# frozen_string_literal: true

class AddPhoneNumberToPerson < ActiveRecord::Migration
  def change
    add_column :people, :phone_number, :string
  end
end
