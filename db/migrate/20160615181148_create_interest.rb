# frozen_string_literal: true

class CreateInterest < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
