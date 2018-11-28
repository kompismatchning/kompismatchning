# frozen_string_literal: true

class AddIdNumberToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :id_number, :string
  end
end
