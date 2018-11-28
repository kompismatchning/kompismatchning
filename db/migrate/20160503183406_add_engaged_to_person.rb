# frozen_string_literal: true

class AddEngagedToPerson < ActiveRecord::Migration
  def change
    add_column :people, :engaged, :boolean, default: false
  end
end
