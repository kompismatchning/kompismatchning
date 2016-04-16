class CreateMatchings < ActiveRecord::Migration
  def change
    create_table :matchings do |t|

      t.timestamps null: false
    end
  end
end
