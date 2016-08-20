class CreateProfessionTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :profession_taggings do |t|
      t.references :person, foreign_key: true
      t.references :profession, foreign_key: true

      t.timestamps null: false
    end
  end
end
