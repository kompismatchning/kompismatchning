# frozen_string_literal: true

class AddContactPreferenceToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :contact_preference, :integer
  end
end
