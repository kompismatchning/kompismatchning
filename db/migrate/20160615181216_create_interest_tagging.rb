# frozen_string_literal: true

class CreateInterestTagging < ActiveRecord::Migration
  def change
    create_table :interest_taggings do |t|
      t.references :person, index: true, foreign_key: true
      t.references :interest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
