class AddReferenceFromMacthingToPerson < ActiveRecord::Migration
  def change
    add_column :matchings, :newcomer_id, :integer
    add_column :matchings, :established_id, :integer
  end
end
