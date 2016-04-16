class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :gender
      t.integer :age
      t.string :email
      t.boolean :established

      t.timestamps null: false
    end
  end
end
