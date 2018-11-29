# frozen_string_literal: true

class AddStartedAtToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :started_at, :datetime
  end
end
