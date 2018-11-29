# frozen_string_literal: true

class AddStatusToPerson < ActiveRecord::Migration
  def change
    add_column :people, :status, :integer
  end
end
