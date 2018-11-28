# frozen_string_literal: true

class RenameMatchingsToMatches < ActiveRecord::Migration
  def change
    rename_table :matchings, :matches
  end
end
