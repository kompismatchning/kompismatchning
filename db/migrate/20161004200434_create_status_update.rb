class CreateStatusUpdate < ActiveRecord::Migration[5.0]
  def change
    create_table :status_updates do |t|
      t.references :match, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
